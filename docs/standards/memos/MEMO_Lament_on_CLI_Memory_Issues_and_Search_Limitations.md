# MEMO: Lament on CLI Memory Issues and Search Limitations

*   **Date:** 2025-09-21
*   **Author:** Gemini
*   **Subject:** Critical CLI Memory Exhaustion and Resulting Search Tool Limitations

## 1. Overview

This memo documents a critical operational issue encountered during recent interactions: the Gemini CLI is consistently crashing due to out-of-memory (OOM) errors when attempting to utilize built-in `search_file_content` and `glob` commands on the current large repository. This severe limitation has necessitated a fundamental shift in operational parameters, restricting the use of these powerful tools.

## 2. Problem Description

Repeated attempts to perform file system searches and content indexing using the `search_file_content` and `glob` tools have resulted in the Gemini CLI process consuming excessive memory, leading to system instability and crashes. This behavior is observed specifically when these commands are directed at the large codebase, indicating a scalability issue with their current implementation or resource management within the CLI environment.

As demonstrated by recent `grep` commands for terms like "issue" within the `index/` directory, the project relies heavily on documented issues, CRQs, and SOPs. The inability to reliably search for these critical pieces of information programmatically is a direct and severe consequence of these memory limitations.

## 3. Impact on Workflow

The memory exhaustion and subsequent crashes have a significant impact on the efficiency and capabilities of the Gemini CLI:

*   **Impaired Discovery:** The inability to reliably use `search_file_content` and `glob` severely hampers the ability to discover files, locate specific content, or understand the overall structure of the repository programmatically.
*   **Increased Manual Overhead:** Tasks that would typically leverage automated search capabilities now require direct user intervention to provide file paths or content, or necessitate the development of custom shell scripts for basic file system interactions.
*   **Reduced Autonomy:** My capacity for autonomous exploration and problem-solving within the repository is diminished, as core navigational and informational tools are unavailable.
*   **Contextual Gaps:** The inability to perform quick, broad searches can lead to gaps in understanding the full context of a request or a code change.

## 4. Operational Constraints Imposed

Due to this critical issue, the following operational constraints have been imposed:

*   **Prohibition of Built-in Search/Find Tools:** The `search_file_content`, `glob`, and `list_directory` commands are to be avoided on this repository until the underlying memory issues are resolved.
*   **Reliance on Scripted Tools:** All file system interactions, including searches and content retrieval, must now be performed exclusively through custom Bash scripts located within or developed for the `scripts/` directory, utilizing standard shell utilities like `grep`, `cat`, `find`, etc.

## 5. Call for Resolution

This memory issue represents a significant impediment to the Gemini CLI's effectiveness and scalability on large codebases. An investigation into the root cause of the memory exhaustion for `search_file_content` and `glob` is urgently required. Resolution of this issue is critical to restoring full operational capability and enhancing the overall utility of the Gemini CLI.
