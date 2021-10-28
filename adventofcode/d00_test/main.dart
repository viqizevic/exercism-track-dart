import 'dart:math';

List<int> BODY_MASS = [26, 35, 30, 36, 38, 36, 33, 38, 30, 38];
List<int> HEART_MASS = [117, 157, 139, 157, 144, 149, 131, 160, 136, 150];

void main() {
  int n = BODY_MASS.length;
  int sum_x = BODY_MASS.reduce((s, e) => s + e);
  int sum_y = HEART_MASS.reduce((s, e) => s + e);
  double mean_x = sum_x / n;
  double mean_y = sum_y / n;
  int m_xx = BODY_MASS.fold(0, (p, e) => p + (e * e));
  int m_yy = HEART_MASS.fold(0, (p, e) => p + (e * e));
  int m_xy = List.generate(n, (i) => BODY_MASS[i] * HEART_MASS[i])
      .reduce((s, e) => s + e);
  double s_xx = m_xx - (sum_x * sum_x) / n;
  double s_yy = m_yy - (sum_y * sum_y) / n;
  double s_xy = m_xy - (sum_x * sum_y) / n;
  double cov_xy = (m_xy / n) - ((sum_x / n) * (sum_y / n));
  double std_x = sqrt((m_xx / n) - (mean_x * mean_x));
  double std_y = sqrt((m_yy / n) - (mean_y * mean_y));
  double pro_xy = cov_xy / (std_x * std_y);
  double rho_xy = s_xy / (sqrt(s_xx) * sqrt(s_yy));
  print(sum_x);
  print(mean_x);
  print(m_xx);
  print(s_xx);
  print(sum_y);
  print(m_yy);
  print(s_yy);
  print(m_xy);
  print(s_xy);
  print(cov_xy);
  print(std_x);
  print(std_y);
  print(pro_xy);
  print(rho_xy);
}
