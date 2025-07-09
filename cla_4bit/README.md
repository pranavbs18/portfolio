# 4-bit Carry Lookahead Adder (CLA) — RTL to GDSII

This project implements a **4-bit Carry Lookahead Adder (CLA)** using Verilog and synthesizes it all the way to GDSII using the **Cadence Digital Full Flow** (SimVision + Genus + Innovus). It also includes lint check, simulation using waveform analysis, synthesis reports, DRC, and final GDS layout.

---

## 📌 Project Overview

- **Design**: CLA (4-bit)
- **Language**: Verilog
- **EDA Tools**:  
  - RTL Simulation & Lint: Cadence **SimVision/Incisive**
  - Synthesis: Cadence **Genus Synthesis Solution**
  - Physical Design: Cadence **Innovus**
- **Library**: `slow`
- **Technology Node**: 90nm TSMC standard cell library used throughout the flow.


---

## Synthesis & Physical Design Summary

| Metric              | Result                  |
|---------------------|-------------------------|
| Standard Cells Used | 20                      |
| Total Area          | 122.618 µm²             |
| DRC Errors          | 26 Shorts (Metal1)      |
| Placement Density   | 50%                     |
| Technology Library  | `slow` (90nm TSMC)      |
| Final Output        | `cla_4bit.gds`          |



##  Key Highlights

> • Designed a 4-bit Carry Lookahead Adder from scratch using Verilog  
> • Completed full **RTL to GDSII** flow using **Cadence Genus and Innovus**  
> • Generated and analyzed **area, timing, DRC** and **physical layout** reports  
> • Verified design using `hal` simulator and conducted structural linting  
> • Produced **final GDSII file** and layout visualization with 20 std cells

## References

- [Carry Lookahead Adder – Wikipedia](https://en.wikipedia.org/wiki/Carry-lookahead_adder)
- Cadence Digital Full Flow documentation
