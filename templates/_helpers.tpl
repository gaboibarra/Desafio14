{{/*
Generate the fullname using the release name and the chart name.
*/}}
{{- define "educacionit-app.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Generate a name that can be used for naming resources.
*/}}
{{- define "educacionit-app.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{/*
Generate standard labels that are used for all resources.
*/}}
{{- define "educacionit-app.labels" -}}
app.kubernetes.io/name: {{ include "educacionit-app.name" . }}
helm.sh/chart: {{ include "educacionit-app.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
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
Generate the chart name and version as used by the chart label.
*/}}
{{- define "educacionit-app.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}

{{/*
Generate the name of the service account to use.
*/}}
{{- define "educacionit-app.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{- default (include "educacionit-app.fullname" .) .Values.serviceAccount.name -}}
{{- else -}}
{{- .Values.serviceAccount.name -}}
{{- end -}}
{{- end -}}
