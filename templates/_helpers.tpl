{{/* Generate the name of the application */}}
{{- define "educacionit-app.name" -}}
{{- default .Chart.Name .Values.nameOverride -}}
{{- end }}

{{/* Generate the full name of the application */}}
{{- define "educacionit-app.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride -}}
{{- else -}}
{{- $name := include "educacionit-app.name" . -}}
{{- if .Values.namespaceOverride -}}
{{- printf "%s-%s" .Values.namespaceOverride $name -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name -}}
{{- end -}}
{{- end -}}
{{- end }}

{{/* Generate selector labels for the application */}}
{{- define "educacionit-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "educacionit-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
