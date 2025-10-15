-- Table References Pull 
SELECT name, type FROM sqlite_master
WHERE type IN ('table','view')
ORDER BY type, name;
-- Looking at Average 
SELECT ROUND(AVG(is_churned) * 100.0, 2) AS churn_rate_pct
FROM churn_clean;

/* here we  are examining Out of 4,000 total customers, 921 have churned, while 3,079 are still active.
This tells us that roughly 23% of the customer base has left the company (921 ÷ 4000 = 0.23).  About one in every four customers has stopped doing business with us. That means we’re currently retaining roughly 3 out of 4 customers
 — good, but there’s significant room for improvement. Implication notes for business- If each customer pays $X per month, losing 921 customers means a direct recurring revenue loss.
Goal: Reduce churn to below 15–18% (industry benchmark for subscription businesses), which would save hundreds of customers and substantial revenue*/

SELECT
  COUNT(*)                    AS total_customers,
  SUM(is_churned)             AS churned_customers,          -- churners are 1
  COUNT(*) - SUM(is_churned)  AS retained_customers
FROM churn_clean;
/* Bucketing Churn rates. Business implication show that New customers (0–5 months) churn at 25%, the highest rate.
After about one year, churn begins to stabilize around 22–23%.
Long-term customers (60+ months) have the lowest churn rate, around 21%
Business Implications-  Early-life churn is the biggest challenge. Customers in their first 6 months are 20% more likely to leave than those who’ve stayed for over 5 years.
 This means the company is losing many customers before they fully settle into the service.Customer maturity = loyalty so we need to pinpoint retention in early stages or propose
 longer contracts to lock in. New customers (0–5 months) churn at 25%, the highest rate.

After about one year, churn begins to stabilize around 22–23%.

Long-term customers (60+ months) have the lowest churn rate, around 21%. Onboarding matters most.

The first few months are the critical risk period.

Improving first-year experience (better communication, setup support, onboarding help etc) can significantly cut churn.*/
 
SELECT
  CASE
    WHEN tenure_months < 6  THEN '0–5'
    WHEN tenure_months < 12 THEN '6–11'
    WHEN tenure_months < 24 THEN '12–23'
    WHEN tenure_months < 36 THEN '24–35'
    WHEN tenure_months < 48 THEN '36–47'
    WHEN tenure_months < 60 THEN '48–59'
    ELSE '60+'
  END AS tenure_bucket,
  COUNT(*) AS customers,
  ROUND(AVG(is_churned)*100.0, 2) AS churn_rate_pct
FROM churn_clean
GROUP BY tenure_bucket
ORDER BY MIN(tenure_months);
-- CUSTOMER SEGMENTATIONS 

/* Here we are looking at contract type to gain more information about chrun rates. This is highly significant.  For example,
 Customers on month-to-month contracts are churning at 34%, while those on annual or two-year contracts churn at only around 9%.
That’s nearly a 3.5× higher churn rate for short-term contracts.
This means contract length is one of the strongest predictors of customer loyalty
BUSINESS IMPLICATIONS 
- Incentivize longer contracts.
Offer small discounts or loyalty points for upgrading to yearly plans.
Highlight convenience, stability, or bundled savings for long-term subscriptions.

Also, Focus overall retention efforts on monthly customers.
This is because early outreach, renewal offers, or personalized retention campaigns could lower overall churn.
FINANCIALS
If even 10% of monthly customers can be converted to annual contracts, total churn could fall below 25%, saving hundreds of customers per year
*/
SELECT Contract AS contract_type,
       COUNT(*) AS customers,
       ROUND(AVG(is_churned)*100.0, 2) AS churn_rate_pct
FROM churn_clean
GROUP BY contract_type
ORDER BY churn_rate_pct DESC;

/* Here we look at payment method and churn.  There isnt much significance in the changes of churn rates per payment method 
However, Customers who pay automatically or electronically tend to churn slightly less, suggesting convenience in payment reduces friction and dropout risk. 
Manual payment users (like mailed checks) remain slightly more at risk 
Regardless, we could push for more automatic payments Auto-pay via credit card or bank transfer seems to correlate with slightly higher retention.
Customers who manually pay each month (checks, manual e-payments) may have more chances to reconsider or cancel.
We could also look into the relationship between to Combine this with contract type → customers on month-to-month + manual payments are likely your highest churn risk segment.*/
SELECT PaymentMethod AS payment_method,
       COUNT(*) AS customers,
       ROUND(AVG(is_churned)*100.0, 2) AS churn_rate_pct
FROM churn_clean
GROUP BY payment_method
ORDER BY churn_rate_pct DESC;

-- Paperless vs not
/* Here we can see that Paperless billing isn’t a churn driver, but it’s operationally beneficial.
It reduces administrative costs and improves sustainability goals.
Keep promoting paperless options for cost savings and efficiency, not necessarily as a retention strategy
We should look to see how PaperlessBilling effects different subgroups. 
*/
SELECT PaperlessBilling,
       COUNT(*) AS customers,
       ROUND(AVG(is_churned)*100.0,2) AS churn_rate_pct
FROM churn_clean
GROUP BY PaperlessBilling
ORDER BY churn_rate_pct DESC;

-- Senior vs non-senior
/* While the difference is modest (≈2 percentage points), it shows that older customers are somewhat more loyal or stable once they subscribe.
Also, this could show us that, Seniors are a steady segment.
They are less likely to switch once established, possibly due to comfort, habit, or less price sensitivity.
Focus on maintaining satisfaction through simple communication and consistent service quality 
In addition, Marketing opportunity could present itself in terms of a
Tailored retention campaigns:
Seniors → emphasize reliability and trust.
Younger customers → emphasize value, speed, and personalization*/
SELECT SeniorCitizen,
       COUNT(*) AS customers,
       ROUND(AVG(is_churned)*100.0,2) AS churn_rate_pct
FROM churn_clean
GROUP BY SeniorCitizen
ORDER BY churn_rate_pct DESC;

-- CONSUMER BEHAVIOR 
/* Here we can see a significant trend. 
Customers paying moderate monthly charges ($40–$80) have the highest churn rates (24%), while both the lowest (<$40) and highest ($100+) spenders churn slightly less (≈22%).
This pattern suggests that mid-tier customers may be most price-sensitive, while higher-paying customers tend to stay longer — possibly because they value premium service or are on bundled plans.
-- BUSINESS INSIGHTS 
Here we could suggest, pricing perception matters.

Need to look into Mid-tier customers may feel they’re not getting enough value relative to cost.
Review features and benefits offered in this price band — are they aligned with customer expectations?  Also, 
Targeted retention campaigns.
Focus retention offers (discounts, added features) on mid-tier customers to prevent drop-offs.
Use survey or feedback data to understand perceived gaps in value*/
SELECT
  CASE
    WHEN MonthlyCharges < 40  THEN '<40'
    WHEN MonthlyCharges < 60  THEN '40–59'
    WHEN MonthlyCharges < 80  THEN '60–79'
    WHEN MonthlyCharges < 100 THEN '80–99'
    ELSE '100+'
  END AS charge_band,
  COUNT(*) AS customers,
  ROUND(AVG(is_churned)*100.0, 2) AS churn_rate_pct
FROM churn_clean
GROUP BY charge_band
ORDER BY MIN(MonthlyCharges);

-- OnlineSecurity vs churn
/* The difference between these groups appears small however, 
it still suggests that customers who adopt value-added or protective services tend to be more loyal. 
BUSINESS IMPLICATIONS
Bundled services drive retention.
Customers with add-on features like Online Security likely feel more invested and protected, increasing their likelihood to stay.
Encouraging service adoption could reduce churn modestly but consistently over time.
Upsell opportunity.
Offer incentives for customers to add security or protection features (e.g., free trials, bundle discounts).*/
SELECT OnlineSecurity,
       COUNT(*) AS customers,
       ROUND(AVG(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0,2) AS churn_rate_pct
FROM churn_raw
GROUP BY OnlineSecurity
ORDER BY churn_rate_pct DESC;

-- TechSupport vs churn
/* Here we can see that Customers with Tech Support churn about 4% less than those without it.
 This might tell us that value-added services and proactive support improve retention — likely by reducing frustration and building trus
--BUSINESS IMPLICATIONS 
Service engagement builds loyalty.
Customers who use Tech Support have more interaction and perceived value, leading to stronger retention.
Preventive support = reduced churn.
Customers without Tech Support might be struggling silently — targeted outreach (tutorials, help guides, or upselling support plans) could save accounts. */
SELECT 
  TechSupport,
  COUNT(*) AS customers,
  ROUND(AVG(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0, 2) AS churn_rate_pct
FROM churn_raw
GROUP BY TechSupport
ORDER BY churn_rate_pct DESC;

-- COHORTS 
/* The average customer stays for about 36.5 months, or roughly 3 years.
That means, on average, the company retains each customer for three years before they leave.
This is a good benchmark — it represents the customer lifetime duration and connects directly to revenue forecasting, customer value, and growth planning.
Our customers stay with us for an average of about 3 years before churning. That’s our current customer lifetime window — extending it even by a few months could have a major financial impact */
SELECT ROUND(AVG(tenure_months),2) AS avg_tenure_months
FROM churn_clean;
/* Here we can see some significant trends.  Firstly,  early cohorts (2020–2021) maintained higher retention (around 80%+), while later cohorts (2024–2025) show slight declines, dipping into the mid-60s.
This could suggest either a recent shift in customer experience, pricing, or market competition impacting newer customers.
BUSINESS IMPLICATIONS
-- Cohorts from 2020–2023 consistently show 75–85% retention — evidence of a stable customer base and effective long-term engagement.
However, Newer cohorts show a clear decline toward 65%.
This suggests new-customer onboarding, product experience, or support may need review.
Consider targeted onboarding improvements or loyalty initiatives for 0-6 month customers to prevent early churn */

SELECT
  strftime('%Y-%m', date('now', printf('-%d months', tenure_months))) AS signup_month,
  ROUND(100 - AVG(is_churned)*100.0, 2) AS retention_pct,
  COUNT(*) AS customers
FROM churn_clean
GROUP BY signup_month
ORDER BY signup_month;

--FINANCIAL IMPACT 
/* Here we see a signifcant insight, Customers who remain with us generate about $95 more revenue on average than those who churn.
 While that gap might seem small per person, at scale it’s substantial — for every 1,000 customers retained, that’s roughly $95,000 in extra revenue preserved over time
 BUSINESS IMPLICATIONS 
 Retained customers not only stay longer but spend more. Even a small per-customer difference compounds dramatically across the customer base
 Also, we could Target at-risk groups (like short-tenure or monthly-contract customers).
Focus retention programs on increasing average tenure by even 10%, which could raise LTV proportionally.
Another significant understanding is that Even small improvements in retention lead to large financial gains. Retaining 1,000 extra customers could preserve nearly $100K in revenue*/


/* Here we can see that Reducing churn by just 1 percentage point saves $2.8K per month, or $33K per year.  
The current churn rate is around 23%, meaning nearly 1 in 4 customers leaves each year.
This results in roughly $64K in monthly lost revenue.
Reducing churn by just 1 percentage point saves $2.8K per month, or $33K per year.
A 5-point reduction could save $13.9K per month, or over $167K annually*/
WITH lost AS (
  SELECT SUM(CASE WHEN is_churned=1 THEN MonthlyCharges ELSE 0 END) AS monthly_rev_lost
  FROM churn_clean
)
SELECT
  ROUND(monthly_rev_lost, 2)        AS est_rev_lost_this_month,
  ROUND(monthly_rev_lost * 0.05, 2) AS est_rev_saved_if_churn_down_5pct
FROM lost;
-------

WITH base AS (
  -- How many customers and current churn rate
  /* */
  SELECT 
    COUNT(*) AS total_customers,
    SUM(is_churned) AS churned_customers,
    ROUND(AVG(is_churned)*100.0,2) AS churn_rate_pct,
    SUM(CASE WHEN is_churned=1 THEN MonthlyCharges ELSE 0 END) AS monthly_rev_lost
  FROM churn_clean
),
scenarios AS (
  VALUES (1),(2),(3),(4),(5)   -- absolute percentage point drops in churn rate
)
SELECT
  s.column1 || ' pp' AS reduce_churn_by,
  b.churn_rate_pct AS current_churn_rate,
  b.monthly_rev_lost AS est_rev_lost_this_month,
  -- revenue saved = monthly_rev_lost * (drop ÷ current churn rate)
  ROUND(b.monthly_rev_lost * (s.column1 * 1.0 / b.churn_rate_pct), 2) AS est_rev_saved_this_month,
  ROUND(b.monthly_rev_lost * (s.column1 * 1.0 / b.churn_rate_pct) * 12, 2) AS est_rev_saved_per_year
FROM base b
CROSS JOIN scenarios s
ORDER BY s.column1;


