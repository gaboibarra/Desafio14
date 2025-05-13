{{/*
Generate the fullname using the release name and the chart name.
*/}}
{{- define "educacionit-app.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Generate a name that can be used for naming resources.
*/}}
{{- define "educacionit-app.name" -}}
{{- if .Values.nameOverride -}}
{{- .Values.nameOverride -}}
{{- else -}}
{{- .Chart.Name -}}
{{- end -}}
{{- end -}}

{{/*
Generate chart labels for all resources.
*/}}
{{- define "educacionit-app.labels" -}}
helm.sh/chart: {{ include "educacionit-app.chart" . }}
app.kubernetes.io/name: {{ include "educacionit-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Generate selector labels.
*/}}
{{- define "educacionit-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "educacionit-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Generate chart metadata.
*/}}
{{- define "educacionit-app.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}
