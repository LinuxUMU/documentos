% ==============================================================================
% Copyright (c) 2026 Marcel M. T (wamu_M) <contact@wamu-m.com>
% 
% This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 
% 4.0 International License (CC BY-NC-SA 4.0). 
% To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/
% 
% DISCLAIMER:
% This software/document class is provided "as is", without warranty of any kind, 
% express or implied, including but not limited to the warranties of merchantability, 
% fitness for a particular purpose, and noninfringement. In no event shall the 
% authors or copyright holders be liable for any claim, damages, or other liability, 
% whether in an action of contract, tort, or otherwise, arising from, out of, or 
% in connection with the software or the use or other dealings in the software.
% 
% Note: Artificial Intelligence (AI) tools were utilized in the drafting and 
% generation of portions of this code.
% ==============================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesExplClass
  {meetingminutes}
  {2026-10-10}
  {3}
  {Meeting minutes document class}

% ============================================================
% Base class
% ============================================================

\LoadClass{article}

% ============================================================
% Packages
% ============================================================

\RequirePackage{xparse}
\RequirePackage{l3keys2e}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

\RequirePackage{graphicx}
\RequirePackage{geometry}
\geometry{headheight=1.5cm}
\RequirePackage{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{enumitem}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{datetime2}
\RequirePackage{hyperref}

% ============================================================
% LaTeX3
% ============================================================

\ExplSyntaxOn

% ============================================================
% Class options
% ============================================================
\tl_new:N \g_mm_language_tl

% Catalan is the default language.
\tl_gset:Nn \g_mm_language_tl { catalan }

% Declare booleans for checking/sorting/hierarchy features
\bool_new:N \g_mm_check_votes_bool
\bool_gset_true:N \g_mm_check_votes_bool

\bool_new:N \g_mm_only_agenda_bool
\bool_gset_false:N \g_mm_only_agenda_bool

\bool_new:N \g_mm_sort_attendees_bool
\bool_gset_true:N \g_mm_sort_attendees_bool

\bool_new:N \g_mm_sort_guests_bool
\bool_gset_true:N \g_mm_sort_guests_bool

\bool_new:N \g_mm_hierarchy_bool
\bool_gset_true:N \g_mm_hierarchy_bool

\keys_define:nn { mm / class }
  {
    language .choice:,

    language / catalan .code:n =
      {
        \tl_gset:Nn \g_mm_language_tl { catalan }
      },

    language / spanish .code:n =
      {
        \tl_gset:Nn \g_mm_language_tl { spanish }
      },

    language / english .code:n =
      {
        \tl_gset:Nn \g_mm_language_tl { english }
      },

    language .initial:n = catalan,

    novotechecks .code:n =
      {
        \bool_gset_false:N \g_mm_check_votes_bool
      },

    agenda .code:n =
      {
        \bool_gset_true:N \g_mm_only_agenda_bool
      },
      
    nosort .code:n =
      {
        \bool_gset_false:N \g_mm_sort_attendees_bool
        \bool_gset_false:N \g_mm_sort_guests_bool
      },
      
    nohierarchy .code:n =
      {
        \bool_gset_false:N \g_mm_hierarchy_bool
      },
  }

\ProcessKeyOptions [ mm / class ]

\PassOptionsToPackage{\g_mm_language_tl}{babel}
\RequirePackage{babel}

% ============================================================
% Localization
% ============================================================

\cs_new:Npn \mm_translate:n #1
  {
    \str_case:VnF \g_mm_language_tl
      {

        % ------------------------------------------------------
        % Catalan
        % ------------------------------------------------------

        { catalan }
          {
            \str_case:nnF {#1}
              {
                { meeting }
                  { Reunió }
                { generalassembly }
                  { Assemblea~General }
                { boardmeeting }
                  { Reunió~de~Junta }
                { extraordinarygeneralassembly }
                  { Assemblea~General~Extraordinària }
                { date }
                  { Data }
                { location }
                  { Lloc }
                { time }
                  { Horari }
                { attendees }
                  { Assistents }
                { guests }
                  { Convidats }
                { agenda }
                  { Ordre~del~dia }
                { name }
                  { Nom }
                { role }
                  { Càrrec }
                { chair }
                  { Presidència }
                { secretary }
                  { Secretaria }
                { treasurer }
                  { Tresoreria }
                { decision }
                  { Acord }
                { action }
                  { Acció }
                { election }
                  { Elecció }
                { vote }
                  { Votació }
                { anonymous_vote }
                  { Votació~anònima}
                { in_favour }
                  { A~favor }
                { against }
                  { En~contra }
                { abstentions }
                  { Abstencions }
                { task}
                  { Tasca}
                { tasks}
                  { Tasques}
                { assignees}
                  { Responsables}
                { deadline}
                  { Data~limit}
              }
              { #1 }
          }

        % ------------------------------------------------------
        % Spanish
        % ------------------------------------------------------

        { spanish }
          {
            \str_case:nnF {#1}
              {
                { meeting }
                  { Reunión }
                { generalassembly }
                  { Asamblea~General }
                { boardmeeting }
                  { Reunión~de~Junta }
                { extraordinarygeneralassembly }
                  { Asamblea~General~Extraordinaria }
                { date }
                  { Fecha }
                { location }
                  { Lugar }
                { time }
                  { Horario }
                { attendees }
                  { Asistentes }
                { guests }
                  { Invitados }
                { agenda }
                  { Orden~del~día }
                { name }
                  { Nombre }
                { role }
                  { Cargo }
                { chair }
                  { Presidencia }
                { secretary }
                  { Secretaría }
                { treasurer }
                  { Tesorería }
                { decision }
                  { Acuerdo }
                { action }
                  { Acción }
                { vote }
                  { Votación }
                { election }
                  { Elección }
                { anonymous_vote }
                  { Votación~anónima}
                { in_favour }
                  { A~favor }
                { against }
                  { En~contra }
                { abstentions }
                  { Abstenciones }
                { task}
                  { Tarea}
                { tasks}
                  { Tareas}
                { assignees}
                  { Responsables}
                { deadline}
                  { Fecha~límite}
              }
              { #1 }
          }

        % ------------------------------------------------------
        % English
        % ------------------------------------------------------

        { english }
          {
            \str_case:nnF {#1}
              {
                { meeting }
                  { Meeting }
                { generalassembly }
                  { General~Assembly }
                { boardmeeting }
                  { Board~Meeting }
                { extraordinarygeneralassembly }
                  { Extraordinary~General~Assembly }
                { date }
                  { Date }
                { location }
                  { Location }
                { time }
                  { Time }
                { attendees }
                  { Attendees }
                { guests }
                  { Guests }
                { agenda }
                  { Agenda }
                { name }
                  { Name }
                { role }
                  { Role }
                { chair }
                  { Chair }
                { secretary }
                  { Secretary }
                { treasurer }
                  { Treasurer }
                { decision }
                  { Decision }
                { action }
                  { Action }
                { vote }
                  { Vote}
                { election }
                  { Election }
                { anonymous_vote }
                  { Anonymous~Vote}
                { in_favour }
                  { In~favour }
                { against }
                  { Against }
                { abstentions }
                  { Abstentions }
                { task}
                  { Task}
                { tasks}
                  { Tasks}
                { assignees}
                  { Assignees}
                { deadline}
                  { Deadline}
              }
              { #1 }
          }
      }
      { #1 }
  }

% ============================================================
% Institution Metadata
% ============================================================

\tl_new:N \g_mm_logo_tl
\tl_new:N \g_mm_institution_tl
\tl_new:N \g_mm_department_tl

\NewDocumentCommand{\headerlogo}{m}
  {
    \tl_gset:Nn \g_mm_logo_tl {#1}
  }

\NewDocumentCommand{\institution}{m}
  {
    \tl_gset:Nn \g_mm_institution_tl {#1}
  }

\NewDocumentCommand{\department}{m}
  {
    \tl_gset:Nn \g_mm_department_tl {#1}
  }

% ============================================================
% Meeting metadata
% ============================================================

\tl_new:N \g_mm_title_tl
\tl_new:N \g_mm_date_tl
\tl_new:N \g_mm_meeting_type_tl
\tl_new:N \g_mm_location_tl
\tl_new:N \g_mm_starttime_tl
\tl_new:N \g_mm_endtime_tl

% ------------------------------------------------------------
% Title, Date, Type, Location, Start time, End time
% ------------------------------------------------------------
\RenewDocumentCommand{\title}{m}{ \tl_gset:Nn \g_mm_title_tl {#1} }
\RenewDocumentCommand{\date}{m}{ \tl_gset:Nn \g_mm_date_tl {#1} }
\NewDocumentCommand{\type}{m}{ \tl_gset:Nn \g_mm_meeting_type_tl {#1} }
\NewDocumentCommand{\location}{m}{ \tl_gset:Nn \g_mm_location_tl {#1} }
\NewDocumentCommand{\starttime}{m}{ \tl_gset:Nn \g_mm_starttime_tl {#1} }
\NewDocumentCommand{\endtime}{m}{ \tl_gset:Nn \g_mm_endtime_tl {#1} }

% ============================================================
% Meeting type localization
% ============================================================

\cs_new:Npn \mm_meeting_type:
  {
    \str_case:VnF \g_mm_meeting_type_tl
      {
        { GeneralAssembly } { \mm_translate:n { generalassembly } }
        { BoardMeeting } { \mm_translate:n { boardmeeting } }
        { ExtraordinaryGeneralAssembly } { \mm_translate:n { extraordinarygeneralassembly } }
      }
      { \tl_use:N \g_mm_meeting_type_tl }
  }

% ============================================================
% Shared Name Processing Helper
% ============================================================
% Splits by semicolon, trims spaces, handles empty input,
% and sorts alphabetically if requested without variable collision.
\seq_new:N \l__mm_process_raw_seq
\tl_new:N \l__mm_process_item_tl

\cs_new_protected:Npn \mm_process_name_list:nN #1#2
  {
    \seq_clear:N #2
    \tl_if_blank:nF {#1}
      {
        \seq_set_split:Nnn \l__mm_process_raw_seq { ; } {#1}
        \seq_map_inline:Nn \l__mm_process_raw_seq
          {
            \tl_set:Nn \l__mm_process_item_tl { ##1 }
            \tl_trim_spaces:N \l__mm_process_item_tl
            \tl_if_empty:NF \l__mm_process_item_tl
              { \seq_put_right:NV #2 \l__mm_process_item_tl }
          }
        \bool_if:NT \g_mm_sort_attendees_bool
          {
            \seq_sort:Nn #2
              {
                \str_compare:eNeTF { ####1 } > { ####2 }
                  { \sort_return_swapped: }
                  { \sort_return_same: }
              }
          }
      }
  }

% ============================================================
% Attendees & Roles (Unified \attendee API)
% ============================================================

\seq_new:N \g_mm_attendees_seq

% Storage token lists for standalone role accessors
\tl_new:N \g_mm_chair_tl
\tl_new:N \g_mm_secretary_tl
\tl_new:N \g_mm_treasurer_tl

% ------------------------------------------------------------
% Add an attendee: \attendee[role]{Name}
% ------------------------------------------------------------
\NewDocumentCommand{\attendee}{ O{} m }
  {
    \str_case:nnF {#1}
      {
        { chair }     { \tl_gset:Nn \g_mm_chair_tl {#2} }
        { secretary } { \tl_gset:Nn \g_mm_secretary_tl {#2} }
        { treasurer } { \tl_gset:Nn \g_mm_treasurer_tl {#2} }
      }
      {}
    \seq_gput_right:Nn \g_mm_attendees_seq { {#2} {#1} }
  }

% ------------------------------------------------------------
% Role shorthands (Getter macros)
% ------------------------------------------------------------
\NewDocumentCommand{\chair}{}     { \tl_use:N \g_mm_chair_tl }
\NewDocumentCommand{\secretary}{} { \tl_use:N \g_mm_secretary_tl }
\NewDocumentCommand{\treasurer}{} { \tl_use:N \g_mm_treasurer_tl }

% ------------------------------------------------------------
% Render attendee row to token list (prevents tabularx scope issues)
% ------------------------------------------------------------
\tl_new:N \l_mm_table_body_tl

\cs_new_protected:Npn \mm_append_attendee_row:nn #1#2
  {
    \tl_put_right:Nn \l_mm_table_body_tl
      {
        #1
        &
        \str_if_empty:nTF {#2}
          { }
          {
            \str_case:nnF {#2}
              {
                { chair }     { \mm_translate:n { chair } }
                { secretary } { \mm_translate:n { secretary } }
                { treasurer } { \mm_translate:n { treasurer } }
              }
              { #2 } % Custom role printed as typed
          }
        \\
      }
  }

% Helper extractions for sorting
\cs_new:Npn \mm_extract_name:nn #1#2 { #1 }
\cs_new:Npn \mm_extract_role:nn #1#2 { #2 }

% Sorting helpers
\cs_new_protected:Npn \mm_sort_by_name:nn #1#2
  {
    \str_compare:eNeTF { \mm_extract_name:nn #1 } > { \mm_extract_name:nn #2 }
      { \sort_return_swapped: }
      { \sort_return_same: }
  }

\cs_new_protected:Npn \mm_sort_by_role_then_name:nn #1#2
  {
    \str_compare:eNeTF { \mm_extract_role:nn #1 } = { \mm_extract_role:nn #2 }
      {
        \str_compare:eNeTF { \mm_extract_name:nn #1 } > { \mm_extract_name:nn #2 }
          { \sort_return_swapped: }
          { \sort_return_same: }
      }
      {
        \str_compare:eNeTF { \mm_extract_role:nn #1 } > { \mm_extract_role:nn #2 }
          { \sort_return_swapped: }
          { \sort_return_same: }
      }
  }

% Sequence declarations for sorting hierarchy
\seq_new:N \l_mm_chair_seq
\seq_new:N \l_mm_sec_seq
\seq_new:N \l_mm_tres_seq
\seq_new:N \l_mm_other_roles_seq
\seq_new:N \l_mm_norole_seq

% ------------------------------------------------------------
% Print attendees
% ------------------------------------------------------------
\cs_new_protected:Npn \mm_print_attendees:
  {
    \seq_if_empty:NF \g_mm_attendees_seq
      {
        \subsection*{\mm_translate:n { attendees }}

        \seq_clear:N \l_mm_chair_seq
        \seq_clear:N \l_mm_sec_seq
        \seq_clear:N \l_mm_tres_seq
        \seq_clear:N \l_mm_other_roles_seq
        \seq_clear:N \l_mm_norole_seq

        \seq_map_inline:Nn \g_mm_attendees_seq
          {
            \str_case:enF { \mm_extract_role:nn ##1 }
              {
                { chair }     { \seq_put_right:Nn \l_mm_chair_seq { ##1 } }
                { secretary } { \seq_put_right:Nn \l_mm_sec_seq { ##1 } }
                { treasurer } { \seq_put_right:Nn \l_mm_tres_seq { ##1 } }
                { }           { \seq_put_right:Nn \l_mm_norole_seq { ##1 } }
              }
              { \seq_put_right:Nn \l_mm_other_roles_seq { ##1 } }
          }

        \bool_if:NT \g_mm_sort_attendees_bool
          {
            \seq_sort:Nn \l_mm_chair_seq { \mm_sort_by_name:nn {##1} {##2} }
            \seq_sort:Nn \l_mm_sec_seq { \mm_sort_by_name:nn {##1} {##2} }
            \seq_sort:Nn \l_mm_tres_seq { \mm_sort_by_name:nn {##1} {##2} }
            \seq_sort:Nn \l_mm_other_roles_seq { \mm_sort_by_role_then_name:nn {##1} {##2} }
            \seq_sort:Nn \l_mm_norole_seq { \mm_sort_by_name:nn {##1} {##2} }
          }

        \tl_clear:N \l_mm_table_body_tl

        \bool_if:NTF \g_mm_hierarchy_bool
          {
            \seq_map_inline:Nn \l_mm_chair_seq { \mm_append_attendee_row:nn ##1 }
            \seq_map_inline:Nn \l_mm_sec_seq { \mm_append_attendee_row:nn ##1 }
            \seq_map_inline:Nn \l_mm_tres_seq { \mm_append_attendee_row:nn ##1 }
            \seq_map_inline:Nn \l_mm_other_roles_seq { \mm_append_attendee_row:nn ##1 }
            \seq_map_inline:Nn \l_mm_norole_seq { \mm_append_attendee_row:nn ##1 }
          }
          {
            % Flattened list logic
            \seq_clear:N \l_tmpa_seq
            \seq_concat:NNN \l_tmpa_seq \l_tmpa_seq \l_mm_chair_seq
            \seq_concat:NNN \l_tmpa_seq \l_tmpa_seq \l_mm_sec_seq
            \seq_concat:NNN \l_tmpa_seq \l_tmpa_seq \l_mm_tres_seq
            \seq_concat:NNN \l_tmpa_seq \l_tmpa_seq \l_mm_other_roles_seq
            \seq_concat:NNN \l_tmpa_seq \l_tmpa_seq \l_mm_norole_seq

            \bool_if:NT \g_mm_sort_attendees_bool
              { \seq_sort:Nn \l_tmpa_seq { \mm_sort_by_name:nn {##1} {##2} } }

            \seq_map_inline:Nn \l_tmpa_seq { \mm_append_attendee_row:nn ##1 }
          }

        \begin{tabularx}
          {\textwidth}
          {
            @{}
            l
            >{\raggedright\arraybackslash}X
            @{}
          }
          \toprule
          \textbf{\mm_translate:n { name }} & \textbf{\mm_translate:n { role }} \\
          \midrule
          \tl_use:N \l_mm_table_body_tl
          \bottomrule
        \end{tabularx}
        \medskip
      }
  }

% ------------------------------------------------------------
% Everyone command
% ------------------------------------------------------------
\NewDocumentCommand{\everyone}{}
  {
    \seq_clear:N \l_tmpa_seq
    \seq_map_inline:Nn \g_mm_attendees_seq
      {
        \seq_put_right:Ne \l_tmpa_seq { \mm_extract_name:nn ##1 }
      }
    \bool_if:NT \g_mm_sort_attendees_bool
      {
        \seq_sort:Nn \l_tmpa_seq
          {
            \str_compare:eNeTF { ##1 } > { ##2 }
              { \sort_return_swapped: }
              { \sort_return_same: }
          }
      }
    \seq_use:Nn \l_tmpa_seq { ; ~ }
  }

% ============================================================
% Guests
% ============================================================
\seq_new:N \g_mm_guests_seq

% Individual guest: \guest[affiliation]{Name}
\NewDocumentCommand{\guest}{ O{} m }
  {
    \seq_gput_right:Nn \g_mm_guests_seq { {#2} {#1} }
  }

% Helper extractions for guests
\cs_new:Npn \mm_extract_guest_name:nn #1#2 { #1 }
\cs_new:Npn \mm_extract_guest_affil:nn #1#2 { #2 }

% Guest sorting helper: Affiliation first, then Name
\cs_new_protected:Npn \mm_sort_guest_by_affil_then_name:nn #1#2
  {
    \str_compare:eNeTF { \mm_extract_guest_affil:nn #1 } = { \mm_extract_guest_affil:nn #2 }
      {
        \str_compare:eNeTF { \mm_extract_guest_name:nn #1 } > { \mm_extract_guest_name:nn #2 }
          { \sort_return_swapped: }
          { \sort_return_same: }
      }
      {
        \str_compare:eNeTF { \mm_extract_guest_affil:nn #1 } > { \mm_extract_guest_affil:nn #2 }
          { \sort_return_swapped: }
          { \sort_return_same: }
      }
  }

\cs_new_protected:Npn \mm_render_guest:nn #1#2
  {
    \item #1 \tl_if_blank:nF {#2} { ~ ( #2 ) }
  }

\cs_new_protected:Npn \mm_print_guests:
  {
    \seq_if_empty:NF \g_mm_guests_seq
      {
        \bool_if:NT \g_mm_sort_guests_bool
          {
            \seq_sort:Nn \g_mm_guests_seq
              {
                \mm_sort_guest_by_affil_then_name:nn {##1} {##2}
              }
          }

        \subsection*{\mm_translate:n { guests }}
        \begin{itemize}[nosep]
          \seq_map_inline:Nn \g_mm_guests_seq { \mm_render_guest:nn ##1 }
        \end{itemize}
        \medskip
      }
  }

% ============================================================
% Agenda
% ============================================================

\newcounter{mmAgenda}
\seq_new:N \g_mm_agenda_seq
\tl_new:N \g_mm_current_agenda_item_tl

\makeatletter
\cs_new_protected:Npn \mm_agenda_add:nn #1#2
  {
    \seq_gput_right:Nn \g_mm_agenda_seq { \item[#1.] #2 }
  }
\newcommand{\mm@aux@agenda}[2]{ \mm_agenda_add:nn {#1} {#2} }
\cs_new_protected:Npn \mm_agenda_write:nn #1#2
  {
    \protected@write \@auxout {} { \string\mm@aux@agenda {#1} {#2} }
  }
\makeatother

\int_new:N \g_mm_checkbox_int

\cs_new_protected:Npn \mm_checkbox: {
  \int_gincr:N \g_mm_checkbox_int
  \CheckBox[ name=mm-checkbox-\int_use:N \g_mm_checkbox_int ]{}
}

\NewDocumentCommand{\agendaitem}{m}
  {
    \refstepcounter{mmAgenda}
    \tl_gset:Nn \g_mm_current_agenda_item_tl {#1}
    \mm_agenda_write:nn {\themmAgenda} {#1}

    \par\bigskip
    \noindent
    {
      \Large\bfseries
      \themmAgenda.
      \bool_if:NT \g_mm_only_agenda_bool { \mm_checkbox: } \quad #1
      \par
    }
    \medskip
  }

\cs_new_protected:Npn \mm_print_agenda:
  {
    \seq_if_empty:NF \g_mm_agenda_seq
      {
        \section*{\mm_translate:n { agenda }}
        \begin{itemize}
          \seq_map_inline:Nn \g_mm_agenda_seq { ##1 }
        \end{itemize}
        \vspace{1em}
      }
  }

% ============================================================
% Voting & Anonymous Voting Subsystem (Inline Rendering)
% ============================================================

\seq_new:N \l_mm_vote_for_seq
\seq_new:N \l_mm_vote_against_seq
\seq_new:N \l_mm_vote_abstain_seq

\NewDocumentCommand{\anonymousvote}{ m m m m }
  {
    \bool_if:NT \g_mm_check_votes_bool {
      \int_compare:nTF { #2 + #3 + #4 != \seq_count:N \g_mm_attendees_seq }
        {
          \PackageError{meetingminutes}
            {Anonymous~vote~count~mismatch}
            {The sum of votes (#2 + #3 + #4 = \int_eval:n{#2+#3+#4}) does not match the total number of attendees (\seq_count:N \g_mm_attendees_seq).}
        }
        {}
    }
      \par
      \vspace{0.4em}
      \noindent
      \textbf{\textsc{\mm_translate:n { anonymous_vote }:}}\c_space_tl\texttt{#1}
      \par
      \vspace{0.1em}
      \begin{tabularx}{\linewidth}{rX}
          \texttt{ \mm_translate:n { in_favour }} & #2 \\
          \texttt{ \mm_translate:n { against }} & #3 \\
          \texttt{ \mm_translate:n { abstentions }} & #4 \\
      \end{tabularx}
      \vspace{1em}
      \par
  }

\NewDocumentCommand{\vote}{ m m m m }
  {
    \mm_process_name_list:nN {#2} \l_mm_vote_for_seq
    \mm_process_name_list:nN {#3} \l_mm_vote_against_seq
    \mm_process_name_list:nN {#4} \l_mm_vote_abstain_seq

    \bool_if:NT \g_mm_check_votes_bool {
      \int_compare:nTF 
        { 
          \seq_count:N \l_mm_vote_for_seq 
          + \seq_count:N \l_mm_vote_against_seq 
          + \seq_count:N \l_mm_vote_abstain_seq 
          != \seq_count:N \g_mm_attendees_seq 
        }
        {
          \PackageError{meetingminutes}
            {Named~vote~count~mismatch}
            {The number of voters does not match the total number of attendees (\seq_count:N \g_mm_attendees_seq).}
        }
        {}
    }
      \par
      \vspace{0.4em}
      \noindent
      \textbf{\textsc{\mm_translate:n { vote }:}}\c_space_tl\texttt{#1}
      \par
      \vspace{0.1em}
      \begin{tabularx}{\linewidth}{rX}
        \texttt{ \mm_translate:n { in_favour }~(\int_eval:n { \seq_count:N \l_mm_vote_for_seq })} &
        \seq_use:Nn \l_mm_vote_for_seq {;\c_space_tl } \\

        \texttt{ \mm_translate:n { against }~(\int_eval:n { \seq_count:N \l_mm_vote_against_seq })} &
        \seq_use:Nn \l_mm_vote_against_seq {;\c_space_tl } \\

        \texttt{ \mm_translate:n { abstentions }~(\int_eval:n { \seq_count:N \l_mm_vote_abstain_seq })} &
        \seq_use:Nn \l_mm_vote_abstain_seq {;\c_space_tl } \\
      \end{tabularx}
      \vspace{1em}
      \par
  }

% ============================================================
% Election Subsystem
% ============================================================

\seq_new:N \g_mm_election_options_seq
\tl_new:N \g_mm_election_abstention_tl
\int_new:N \l_mm_election_total_int
\seq_new:N \l_mm_election_voters_seq

\NewDocumentCommand{\election}{ m m }
  {
    \seq_gclear:N \g_mm_election_options_seq
    \tl_gclear:N \g_mm_election_abstention_tl
    \int_zero:N \l_mm_election_total_int

    #2

    \bool_if:NT \g_mm_check_votes_bool {
      \int_compare:nTF 
        { \l_mm_election_total_int != \seq_count:N \g_mm_attendees_seq }
        {
          \PackageError{meetingminutes}
            {Election~vote~count~mismatch}
            {The total number of votes in the election (\int_use:N \l_mm_election_total_int) does not match the total number of attendees (\seq_count:N \g_mm_attendees_seq).}
        }
        {}
    }

    \par
    \vspace{0.4em}
    \noindent
    \textbf{\textsc{\mm_translate:n { election }:}}\c_space_tl \texttt{#1} \newline
    \vspace{0.1em}
    \begin{tabularx}{\linewidth}{rX}
        \seq_use:Nn \g_mm_election_options_seq { \\ }
        \tl_if_blank:nF \g_mm_election_abstention_tl{
            \seq_if_empty:NF \g_mm_election_options_seq { \\[0.5em] }
            \tl_use:N \g_mm_election_abstention_tl \\
        }
    \end{tabularx}
    \vspace{1em}
    \par
  }

\NewDocumentCommand{\electionoption}{ m m }
  {
    \mm_process_name_list:nN {#2} \l_mm_election_voters_seq
    \int_set:Nn \l_tmpa_int { \seq_count:N \l_mm_election_voters_seq }
    
    \int_add:Nn \l_mm_election_total_int { \l_tmpa_int }

    \seq_gput_right:Nx \g_mm_election_options_seq
      {
          \exp_not:n{\texttt{ #1 }\c_space_tl} 
          (\int_use:N \l_tmpa_int) 
          \exp_not:n { & }
          \seq_use:Nn \l_mm_election_voters_seq { ; \c_space_tl } 
      } 
  }

\NewDocumentCommand{\abstention}{ m }
  {
    \mm_process_name_list:nN {#1} \l_mm_election_voters_seq
    \int_set:Nn \l_tmpa_int { \seq_count:N \l_mm_election_voters_seq }
    
    \int_add:Nn \l_mm_election_total_int { \l_tmpa_int }

    \tl_set:Nx \g_mm_election_abstention_tl
      {
          \exp_not:n{\texttt{\mm_translate:n { abstentions } }\c_space_tl} 
          (\int_use:N \l_tmpa_int) 
          \exp_not:n { & }
          \seq_use:Nn \l_mm_election_voters_seq { ; \c_space_tl } 
      }
  }

% ============================================================
% Task / Action Items Subsystem
% ============================================================

\seq_new:N \g_mm_tasks_seq

\NewDocumentCommand{\task}{ O{} m m }
  {
    \seq_gput_right:Nn \g_mm_tasks_seq
      {
          #3  &  #2  &  \tl_if_blank:nTF { #1 } {\textit{N/A}} { #1 } 
      }
      
      \par
      \vspace{0.4em}
      \noindent
      \textbf{\textsc{\mm_translate:n { task }:}}\c_space_tl \texttt{#3}\newline 
      \vspace{0.1em}
      \begin{tabularx}{\linewidth}{rX}
          \texttt{\mm_translate:n { assignees }} & #2 \\
           \tl_if_blank:nF { #1 } {\texttt{\mm_translate:n { deadline }}& #1 \\} 
      \end{tabularx}
      \vspace{1em}
      \par
  }

\NewDocumentCommand{\printtasks}{ }
  {
    \seq_if_empty:NF \g_mm_tasks_seq
      {
        \clearpage
        \section*{\mm_translate:n { tasks }}
        \vspace{0.5em}
        \noindent
        \begin{tabularx}{\linewidth}{X l l}
          \toprule
            \textbf{\mm_translate:n { task }} & \textbf{\mm_translate:n { assignees }} & \textbf{\mm_translate:n { deadline }} \\
          \midrule
          \seq_use:Nn \g_mm_tasks_seq { \\ } \\
          \bottomrule
        \end{tabularx}
      }
  }

% ============================================================
% Repeating Header Style (Every Page)
% ============================================================
\pagestyle{fancy}
\fancyhf{} 

\fancyhead[L]{
  \tl_if_empty:NF \g_mm_logo_tl
    { \includegraphics[height=0.8cm]{\tl_use:N \g_mm_logo_tl} }
}

\fancyhead[R]{
  \small\bfseries \tl_use:N \g_mm_institution_tl
  \tl_if_empty:NF \g_mm_department_tl
    {
      \\
      \tiny\mdseries\em \tl_use:N \g_mm_department_tl
    }
}

\fancyfoot[C]{\thepage}

% ============================================================
% Meeting title
% ============================================================

\RenewDocumentCommand{\maketitle}{}
  {
    \begin{center}
      {
        \LARGE
        \bfseries
        \tl_use:N \g_mm_title_tl
        \par
      }

      \vspace{0.5em}

      {
        \large
        \mm_meeting_type:
        \par
      }

      \vspace{1em}
    \end{center}

    \bool_if:nT
    {
            ! \tl_if_empty_p:N \g_mm_date_tl||
            ! \tl_if_empty_p:N \g_mm_location_tl ||
            ! \tl_if_empty_p:N \g_mm_starttime_tl ||
            ! \tl_if_empty_p:N \g_mm_endtime_tl
    }
    {
      \begin{tabular}{rl}

        \tl_if_empty:NF \g_mm_date_tl {
        \textbf{\mm_translate:n { date }}: & \tl_use:N \g_mm_date_tl \\ 
        }

        \tl_if_empty:NF \g_mm_location_tl {
        \textbf{\mm_translate:n { location }}: & \tl_use:N \g_mm_location_tl \\
        }

        \bool_if:nT
        {
            ! \tl_if_empty_p:N \g_mm_starttime_tl ||
            ! \tl_if_empty_p:N \g_mm_endtime_tl
        }
        {
        \textbf{\mm_translate:n { time }}: &
        \tl_if_empty:NF \g_mm_starttime_tl{ \tl_use:N \g_mm_starttime_tl }
        \bool_if:nT
        {
            ! \tl_if_empty_p:N \g_mm_starttime_tl ||
            ! \tl_if_empty_p:N \g_mm_endtime_tl
        }
        { -- }
          \tl_if_empty:NF \g_mm_endtime_tl { \tl_use:N \g_mm_endtime_tl }
        }

      \end{tabular}

    \vspace{1.5em}
    }

    \bool_if:NF \g_mm_only_agenda_bool 
    {
      \mm_print_attendees:
      \mm_print_guests:
    }
    
    \mm_print_agenda:

    \clearpage
  }

% ============================================================
% End of class
% ============================================================

\ExplSyntaxOff

\endinput
% ==============================================================================
% DOCUMENTATION & API REFERENCE (meetingminutes v3.0)
% ==============================================================================
%
% ------------------------------------------------------------------------------
% Class Options
% ------------------------------------------------------------------------------
% \documentclass[options]{meetingminutes}
%
% language=catalan|spanish|english
%   Sets the document language for headers, labels, and localized terms (default: catalan).
% novotechecks
%   Disables automatic verification of vote counts against the total registered attendees.
% agenda
%   Generates an interactive agenda checklist document instead of full meeting minutes.
% nosort
%   Disables automatic alphabetical sorting for attendees, guests, and voters globally.
% nohierarchy
%   Flattens the attendee table alphabetically without prioritizing board roles (Chair, Secretary, Treasurer).
%
% ------------------------------------------------------------------------------
% Command Reference
% ------------------------------------------------------------------------------
%
% --- Institution & Document Setup ---
%
% \headerlogo{file}
%   Sets the logo image path for the top-left header.
% \institution{name}
%   Sets the primary institution or organization name for the top-right header.
% \department{name}
%   Sets the department or sub-unit name displayed below the institution header.
% \title{title}
%   Sets the title of the meeting document.
% \type{type}
%   Sets the meeting type (e.g., GeneralAssembly, BoardMeeting, ExtraordinaryGeneralAssembly, or custom string).
% \date{date}
%   Sets the meeting date.
% \location{place}
%   Sets the physical or virtual meeting location.
% \starttime{time}
%   Sets the meeting start time.
% \endtime{time}
%   Sets the meeting end time.
% \maketitle
%   Renders the title block, metadata summary, attendee/guest tables, and generated agenda.
%
% --- People & Roles ---
%
% \attendee[role]{name}
%   Registers an attendee. The optional [role] argument accepts built-in keys (chair, secretary, treasurer)
%   or custom role strings (e.g., \attendee[Vice President]{Alice}).
% \chair
%   Getter shorthand that returns the stored name of the Chair.
% \secretary
%   Getter shorthand that returns the stored name of the Secretary.
% \treasurer
%   Getter shorthand that returns the stored name of the Treasurer.
% \guest[affiliation]{name}
%   Registers a guest with an optional affiliation or organization. Guests are automatically sorted
%   by affiliation first, then by name (unless `nosort` is enabled).
% \everyone
%   Prints a comma-separated list of all registered attendees in the active document sorting order.
%
% --- Agenda & Structure ---
%
% \agendaitem{title}
%   Creates a numbered agenda section and logs the item to the generated agenda summary.
%
% --- Voting & Elections ---
%
% \vote{motion}{in_favour}{against}{abstentions}
%   Records a named vote with semicolon-separated lists of voter names for each outcome.
% \anonymousvote{motion}{in_favour_count}{against_count}{abstentions_count}
%   Records an anonymous vote using numerical counts for each outcome.
% \election{title}{body}
%   Container block for an election vote containing \electionoption and \abstention entries.
% \electionoption{option_name}{voters}
%   Adds an option row to an election block with a semicolon-separated list of voter names.
% \abstention{voters}
%   Adds an abstention row to an election block with a semicolon-separated list of voter names.
%
% --- Action Items & Tasks ---
%
% \task[deadline]{assignees}{description}
%   Logs an inline task entry with an optional deadline and assignees.
% \printtasks
%   Generates a standalone summary page containing all recorded tasks in a table format.
%
% ==============================================================================
