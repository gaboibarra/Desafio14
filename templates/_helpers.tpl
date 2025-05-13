{{/* Nombre de la aplicación */}}
{{- define "educacionit-app.name" -}}
{{- default .Chart.Name .Values.nameOverride -}}
{{- end }}

{{/* Nombre completo (fullname) de la aplicación */}}
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

{{/* Etiquetas de selector (para selectors de Kubernetes) */}}
{{- define "educacionit-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "educacionit-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Etiquetas estándar de la aplicación (para metadata) */}}
{{- define "educacionit-app.labels" -}}
app.kubernetes.io/name: {{ include "educacionit-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end }}
