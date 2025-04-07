# 📂 Data

This folder contains supplementary data files, variable descriptions, and relevant tables for the study.

---

📌 Table of Contents
  
- [Data Source](#data-source)  
- [Data Availability](#data-availability)  
- [Selected Variables and Rationale](#selected-variables-and-rationale)  
- [Definitions](#definitions)  
  - [Gender Identity](#gender-identity)  
  - [Sex](#sex)  
  - [Sexual Orientation](#sexual-orientation)  
  - [IFV and GBV](#ifv-and-gbv)  
- [Data Transformation](#data-transformation)  
- [Final Dictionary](#final-dictionary)  
- [References](#references)
  

--------------------------------

<details>
<summary><strong>📍 Data Source</strong></summary>

In Colombia, reporting of Gender-Based violence **GBV** and Intrafamily violence **IFV** is mandatory for epidemiological surveillance under **Law 248 of 1995**.  
For this study, we used data from the **National Institute of Health (INS - *Instituto Nacional de Salud*)** via the **SIVIGILA** system, which collects nationwide public health information.  

Clinicians report **GBV** and **IFV** cases using a standardized form during medical consultations (see the file **INS 875**). The data, including demographics and event details, are entered into the **SIVIGILA** system and analyzed primarily using descriptive statistics.  

As mandated by **Law 1712 of 2014**, all data are publicly available with ensured anonymization.

</details>

---

<details>
<summary><strong>🛰️ Data Availability</strong></summary>
  
According to the **Instituto Nacional de Salud (INS)** guidelines, the original and secondary data are restricted to the principal researchers and are not publicly accessible.  

However, researchers and the public can request access to the original data via the following link:  
➡️ [INS Data Request Portal](https://portalsivigila.ins.gov.co/)

</details>

---

<details>
<summary><strong>📊 Selected Variables and Rationale</strong></summary>

Most variables in the official records are **categorical**, describing:

- Subjects' sociodemographic characteristics.
- Event details such as the date, primary type of violence, and the relationship with the aggressor.

Although the dataset includes over 100 variables, we selected **19 original variables** for our research (see **Table 1**) based on exploratory analyses conducted during the pilot study.

</details>

---

<details>
<summary><strong>📘 Definitions</strong></summary>

  
This study follows Colombia’s **official national institution definitions** for all variables and measures described below.

### [Gender Identity](#gender-identity)
An individual's self-identification influenced by social, historical, and cultural definitions of femininity, masculinity, or the spectrum between them [1].

### [Sex](#sex)
Refers to genetic, hormonal, and structural body traits [1].

### [Sexual Orientation](#sexual-orientation)
An individual's capacity for emotional, affectionate, and sexual attraction to people of a different, the same, or multiple genders, along with the ability to form intimate relationships [1].

### [IFV and GBV](#ifv-and-gbv)
According to **INS** protocols, **IFV** and **GBV** include:

- **Sexual violence:** Any sexual act forced upon someone against their will.
- **Physical violence:** Any act of aggression causing bodily harm (e.g., hitting or pushing).
- **Psychological violence:** Actions that harm mental or emotional well-being.
- **Neglect and abandonment:** Failure to meet the basic needs of vulnerable groups such as children, adolescents, older adults, or individuals with disabilities.

The **INS** also recognizes:
- Attacks involving chemical agents.
- Violence against children, adolescents, women, and individuals with non-normative gender identities or sexual orientations.
- Female genital mutilation [2].

The **INS** follows the **World Health Organization (WHO)**'s broader definition of violence, which includes:
- The use of force or the threat of force.
- Coercion or circumstances that limit the victim's ability to give free consent [3], [2].

</details>

---

<details>
<summary><strong>🛠️ Data Transformation</strong></summary>

### Survivor’s Age
The quantitative variable **"Survivor’s age"** was categorized following Colombia’s **Ministry of Health** definitions:  
- **Early childhood:** 0–5 years  
- **Childhood:** 6–11 years  
- **Adolescence:** 12–18 years  
- **Youth:** 19–26 years  
- **Adulthood:** 27–59 years  
- **Older adult:** 60+ years [4]

---

### Event’s Date
The variable **"Event’s date"** was divided into two periods:  
- **Prepandemic:** 2017–2019  
- **Pandemic:** 2021–2022  

Data from **2020** was split according to Colombia's official pandemic start date (**March 25, 2020**) [5]:  
- Dates before this were classified as **"Prepandemic"**  
- Dates including this date and after this were classified as **"Pandemic"**  

A secondary variable was created to identify each period.

---

### Survivor’s Nationality
For the **"Survivor’s nationality"** variable, we categorized individuals into three groups:  
- **Colombian**  
- **Venezuelan** (to highlight GBV and IFV within the migrant community)  
- **Other** (all other nationalities)

---

### Survivor’s Occupation
The variable **"Survivor’s occupation"** was categorized using the latest **International Standard Classification of Occupations (ISCO)** by the **International Labor Organization** [6]:  
- **Manual workers and craft jobs**  
- **Technicians and administrative support workers**  
- **Professionals and managers**  
- **Armed Forces Occupations**  

---

### Survivor’s Main Activity
The variable **"Survivor’s main activity"** was grouped into five categories for consistency:  
- **Other activities**  
- **Students and civic leaders**  
- **Domestic workers, homemakers, and caregivers**  
- **Farmers and peasants**  
- **Sex workers**  

## INS Data Collection Protocols and Classification

The **INS data collection protocols** state that the categories of violence—**"Physical," "Sexual", "Neglect and Abandonment,"** and **"Psychological"**—are:

- **Mutually exclusive**
- **Hierarchical**, where only the **most severe** type of violence is recorded [2]: 

### Hierarchy of Violence Categories
- **Sexual violence** is considered the most severe and is prioritised when multiple forms of violence occur against the same individual [2]: 
- Followed by:
  - **Physical violence**
  - **Psychological violence**
  - **Neglect and Abandonment** (ranked last) [2]: 

### Reclassification of Sexual Violence Categories
The variable **"Type of Sexual Violence"** originally included eight categories, which we reclassified into four categories based on:

- **Medico-legal definitions**
- **Case similarities**

### Table 2. INS Record’s Sexual Violence Categories and Definitions

| **New Categories** | **Original Categories** | **Definitions** |
|--------------------|-------------------------|------------------|
| **Sexual abuse and sexual harassment** | Sexual abuse | Non-consensual sexual acts, either through direct physical intrusion or threats, often in situations where there is a power imbalance, such as with minors or vulnerable individuals (7). |
|  | Sexual harassment | Unwelcome sexual behavior or advances, including verbal or physical actions, that create a hostile or offensive atmosphere. This can include sexual comments or demands that disrupt work or daily activities (7). |
| **Rape, sexual assault and sexual acts involving the use of force** | Rape | Forced, threat, or coerced penetration of the vulva or anus, using a penis, body parts, or objects. It is one of the most severe forms of sexual violence​ (3,7). |
|  | Sexual assault and sexual acts involving the use of force | Broader range of non-consensual sexual contact, often including unwanted touching or groping, and can overlap with rape depending on the act. In Colombia, sexual assault is not a legal term (3,7). |
| **Sexual exploitation of minors and human trafficking for sexual exploitation** | Sexual exploitation of minors | The exploitation or coercion of individuals under 18 for sexual purposes, usually for profit, and classified as a form of aggravated sexual abuse (3,7). |
|  | Human trafficking for sexual exploitation | Illegal trade of individuals, primarily women and children, for the purpose of sex work, across or within borders, often involving forced labor, abuse, and violation of the victim’s rights as a condition for facilitating migration conditions (3). |
| **Other sexual acts (forced nudity, sterilization and contraception, female genital mutilation)** | Forced nudity, sterilization and contraception | Forced nudity is defined as non-consensual exposure of an individual’s body, often used as a form of humiliation or control. This category also includes the non-consensual sharing of photographs and images (8). |Forced sterilization involves the involuntary removal or blocking of reproductive organs (9). |Forced contraception is the coercion of an individual into using contraceptives methods against their will, often as a control tactic ​(8).
|  | Female genital mutilation | Any practice that includes removing part or all of the external female genitalia or causing harm to female genital organs without medical justification (10). |

### Data Reclassification and Variable Construction
This reclassification followed **national and international medico-legal** and **public health definitions**. Similar to the **"Type of violence"** classification, cases of **"Sexual violence"** record only the most severe subcategory, as determined by clinicians during routine evaluations—not by the victims (2).

- The **"Type of violence"** variable was constructed by combining two complementary original variables:  
  - **"Violence’s nature"**  
  - **"Type of sexual violence"**  

The final **"Type of violence"** categories were four mutually exclusive levels:

- **Physical violence**  
- **Sexual violence**  
- **Psychological violence**  
- **Neglect and abandonment**  

Meanwhile, the variable **"Type of sexual violence"** (applicable only to cases classified as **"Sexual violence"**) was retained in the four categories detailed in **Table 2**.

### Aggressor Category Consolidation
All known aggressors from the original variable **"Non-family relationship with the aggressor"** were combined into a single category, which includes:

- **"Teacher/Professor"**, **"Friend"**, **"Coworker"**, **"Classmate"**, **"Other acquaintance"**, **"Neighbor"**, **"Acquaintance with no close interaction"**, **"Boss"**, **"Priest/Pastor"**, and **"Public servant"**.  
- The **"Unknown"** category was retained.  

The final categories are:

- **"Known but not family"**  
- **"Unknown and not family"**  

This was then combined with the original variable, **"Survivor’s family relationship with the aggressor"**, to create a new variable: **"Survivor’s relationship with the aggressor"**.

### Injury Mechanism Reclassification
The original variable **"Injury mechanism"** was grouped into four final levels based on:

- **Response percentages lower than 5%**
- **Content similarity**

The final levels are:

- **"Blunt, cutting, stabbing, and related injuries"**  
- **"Falls, firearm projectiles, and others"**  
- **"Hanging, strangulation, suffocation"**  
- **"Burns (water, acid, alkalis, household substances)"**  

### Event Location Consolidation
The original variable **"Event’s location"** was consolidated into two groups:

- **"Household"**  
- **"Public Spaces"**  

### Retained Variables
The following variables were retained as in the original datasets:

- **"Survivor’s sex"**  
- **"Survivor’s gender identity"**  
- **"Survivor’s sexual orientation"**  
- **"Survivor as head of household"**  
- **"Survivor’s current pregnancy status"**  
- **"Co-living with the aggressor"**  
- **"Aggressor’s sex"**  

(See Table 1 for further details.)


</details>  

-----


<details>
<summary><strong>📑 Final Dictionary</strong></summary>


This document contains the dictionary for the 19 variables used in the descriptive analysis, and a subset of 10 variables used in the Multiple Correspondence Analysis (MCA) for the project.

---

### 1. Variables Used in the Descriptive Analysis (n = 19)

| Variable Name              | Description                                               | Type                     | Response Options                                                                 |
|---------------------------|-----------------------------------------------------------|--------------------------|----------------------------------------------------------------------------------|
| `age`                     | Survivor’s age at the time of the event (in years)        | Continuous (numeric)     | Values starting from 0                                                           |
| `life_cycle`              | Age group based on Colombia’s Ministry of Health          | Categorical (ordinal)    | Early childhood (0–5), Childhood (6–11), Adolescence (12–18), Youth (19–26), Adulthood (27–59), Older adults (60+) |
| `nationality`             | Survivor’s nationality                                     | Categorical (nominal)    | Colombian, Venezuelan, Other                                                     |
| `sex`                     | Survivor’s sex assigned at birth                          | Categorical (binary)     | Female, Male                                                                     |
| `gender_identity`         | Self-reported gender identity                             | Categorical (nominal)    | Woman, Man, Transgender                                                          |
| `sexual_orientation`      | Self-reported sexual orientation                          | Categorical (nominal)    | Heterosexual, Bisexual, Homosexual, Asexual                                     |
| `occupation`              | Survivor’s occupation at the time of the event            | Categorical (nominal)    | Manual workers and elementary occupations, Technicians and administrative support workers, Professionals and managers, Armed Forces occupations |
| `main_activity`           | Survivor’s main activity                                   | Categorical (nominal)    | Students and civic leaders, Domestic workers/homemakers/caregivers, Farmers and peasants, Sex workers |
| `pregnant_status`         | Whether the survivor was pregnant at the time of the event| Binary (yes/no)          | Yes, No                                                                          |
| `head_of_household`       | Survivor is the head of the household                     | Binary (yes/no)          | Yes, No                                                                          |
| `type_of_violence`        | Main type of violence reported                            | Categorical (nominal)    | Physical, Sexual, Psychological, Negligence and abandonment                     |
| `sexual_violence_subtype` | Specific subtype of sexual violence                       | Categorical (nominal)    | Sexual abuse and harassment, Rape/sexual assault/acts involving force, Other sexual acts (e.g., forced nudity, sterilization, genital mutilation), Sexual exploitation and trafficking |
| `history_of_violence`     | Prior history of violence                                 | Binary (yes/no)          | Yes, No                                                                          |
| `aggressor_sex`           | Sex of the aggressor                                      | Categorical (nominal)    | Male, Female, Undetermined                                                       |
| `relationship_aggressor`  | Relationship between survivor and aggressor               | Categorical (nominal)    | Partner, Ex-partner, Mother, Father, Other family member, Known (non-family), Unknown (non-family), Undetermined stranger |
| `coliving_with_aggressor` | Survivor cohabits with the aggressor                      | Binary (yes/no)          | Yes, No                                                                          |
| `mechanism_of_injury`     | Main physical mechanism of injury                         | Categorical (nominal)    | Blunt/cutting/stabbing injuries, Falls/firearms/others, Strangulation/suffocation, Burns (e.g., water, acid, alkalis) |
| `event_location`          | Location where the violent event occurred                 | Categorical (nominal)    | Household, Public spaces                                                         |
| `pandemic_period`         | Timing of the event in relation to the COVID-19 pandemic  | Categorical (nominal)    | Pre-pandemic, Pandemic                                                           |

---

### 2. Subset of Variables Used in Multiple Correspondence Analysis (MCA) (n = 10)

| Variable Name              | Description                                               | Type                     | Response Options                                                                 |
|---------------------------|-----------------------------------------------------------|--------------------------|----------------------------------------------------------------------------------|
| `sex`                     | Survivor’s sex assigned at birth                          | Categorical (binary)     | Female, Male                                                                     |
| `main_activity`           | Survivor’s main activity                                   | Categorical (nominal)    | Students and civic leaders, Domestic workers/homemakers/caregivers, Farmers and peasants, Sex workers |
| `history_of_violence`     | Prior history of violence                                 | Binary (yes/no)          | Yes, No                                                                          |
| `coliving_with_aggressor` | Survivor cohabits with the aggressor                      | Binary (yes/no)          | Yes, No                                                                          |
| `pandemic_period`         | Timing of the event in relation to the COVID-19 pandemic  | Categorical (nominal)    | Pre-pandemic, Pandemic                                                           |
| `mechanism_of_injury`     | Main physical mechanism of injury                         | Categorical (nominal)    | Blunt/cutting/stabbing injuries, Falls/firearms/others, Strangulation/suffocation, Burns (e.g., water, acid, alkalis) |
| `event_location`          | Location where the violent event occurred                 | Categorical (nominal)    | Household, Public spaces                                                         |
| `life_cycle`              | Age group based on Colombia’s Ministry of Health          | Categorical (ordinal)    | Early childhood (0–5), Childhood (6–11), Adolescence (12–18), Youth (19–26), Adulthood (27–59), Older adults (60+) |
| `type_of_violence`        | Main type of violence reported                            | Categorical (nominal)    | Physical, Sexual, Psychological, Negligence and abandonment                     |
| `relationship_aggressor`  | Relationship between survivor and aggressor               | Categorical (nominal)    | Partner, Ex-partner, Mother, Father, Other family member, Known but not family, Unknown and not family, Undetermined stranger |



**Note:** Life cycle groups are defined according to the Colombian Ministry of Health [4]:

</details>

--------------------------

<details>
<summary><strong>📚 References</strong></summary>

## References

[1]: [Observatorio Nacional de Violencias Línea de Violencias de Género Colombia. *Serie Registros, Observatorios, Sistemas de Seguimiento y Salas Situacionales en Salud ROSS Colombia*. Bogotá; 2016.](https://example.com/reference37)  
[2]: [Instituto Nacional de Salud de Colombia. *Protocolo de Vigilancia de Violencia de Género e Intrafamiliar y Ataques con Agentes Químicos*. 2022.](https://www.ins.gov.co/)  
[3]: [World Health Organization. *World Report on Violence and Health*. 2002.](https://www.who.int/publications/i/item/violence-prevention)  
[4]: [Ministerio de Salud y de Protección Social de Colombia. *Ciclo de Vida*. 2024. Available from: [https://www.minsalud.gov.co/proteccionsocial/Paginas/cicloVida.aspx](https://www.minsalud.gov.co/proteccionsocial/Paginas/cicloVida.aspx)]  
[5]: [Instituto Nacional de Salud - Observatorio Nacional de Salud. *Covid-19 en Colombia, consecuencias de una pandemia en desarrollo: Décimo Segundo Informe Técnico*. Bogotá; 2020.]  
[6]: [Comisión Europea. *Clasificación Europea de Capacidades/Competencias CYO. International Standard Classification of Occupations (ISCO)*.]  
[7]: [Instituto Nacional de Medicina Legal y Ciencias Forenses. *Guía para el abordaje forense integral en la investigación de la violencia sexual*. Bogotá, Colombia; 2018.]  
[8]: [El Congreso de Colombia. *Ley 1719 de 2014*. Colombia; 2014. Available from: [https://www.funcionpublica.gov.co/eva/gestornormativo/norma.php?i=57716](https://www.funcionpublica.gov.co/eva/gestornormativo/norma.php?i=57716)]  
[9]: [Human Rights Watch. *Sterilization of Women and Girls with Disabilities*. 2011. Available from: [https://www.hrw.org/news/2011/11/10/sterilization-women-and-girls-disabilities](https://www.hrw.org/news/2011/11/10/sterilization-women-and-girls-disabilities)]  
[10]: [World Health Organization. *Female Genital Mutilation*. 2024. Available from: [https://www.who.int/news-room/fact-sheets/detail/female-genital-mutilatio](https://www.who.int/news-room/fact-sheets/detail/female-genital-mutilatio)]  

</details>


