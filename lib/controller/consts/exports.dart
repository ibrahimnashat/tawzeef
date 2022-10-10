//shared widgets
export '../widgets/image.dart';
export '../widgets/buttons.dart';
export '../widgets/widget.dart';
export '../widgets/text_filed.dart';
export '../widgets/context.dart';
export '../widgets/text.dart';
export '../widgets/toast.dart';
export '../widgets/date_time.dart';
export '../widgets/padding.dart';
export '../widgets/drop_down.dart';
export '../widgets/loader.dart';
export '../widgets/strings.dart';

//consts
export 'package:tawzeef/controller/consts/colors.dart';
export 'package:tawzeef/controller/consts/font_families.dart';
export 'package:tawzeef/controller/consts/font_sizes.dart';
export 'package:tawzeef/controller/consts/pngs.dart';
export 'package:tawzeef/controller/consts/spaces.dart';
export 'package:tawzeef/controller/consts/svgs.dart';
export 'package:tawzeef/controller/consts/url.dart';

//packages
export 'package:flutter/material.dart';
export 'package:delayed_display/delayed_display.dart';
export 'package:riverpod/riverpod.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:flutter_spinkit/flutter_spinkit.dart';
export 'package:bouncing_widget/bouncing_widget.dart';
export 'package:flutter_easyloading/flutter_easyloading.dart';
export 'package:flutter_riverpod/flutter_riverpod.dart';
export 'package:google_nav_bar/google_nav_bar.dart';
export 'package:pin_code_fields/pin_code_fields.dart';
export 'package:bottom_picker/bottom_picker.dart';
export 'package:flutter/services.dart';
export 'package:photo_view/photo_view.dart';
export 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
export 'package:just_bottom_sheet/just_bottom_sheet.dart';
export 'package:omni_datetime_picker/omni_datetime_picker.dart';
export 'package:awesome_loader_null_safety/awesome_loader_null_safety.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:file_picker/file_picker.dart';
export 'package:localization/localization.dart';
export 'package:flutter_localizations/flutter_localizations.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:paginated_list/paginated_list.dart';
export 'package:fcm_config/fcm_config.dart';

//views

//---- max view of company and officer ----
export 'package:tawzeef/views/splash_screen/splash_screen.dart';
export 'package:tawzeef/views/choose_language_screen/chooseLanguage_screen.dart';
export 'package:tawzeef/views/login_type_screen/login_type_screen.dart';
export 'package:tawzeef/views/login_screen/login_screen.dart';
export 'package:tawzeef/views/sign_up_screen/sign_up_screen.dart';
export 'package:tawzeef/views/verify_screen/verify_code_screen.dart';
export 'package:tawzeef/views/forget_password_screen/forget_password_screen.dart';
export 'package:tawzeef/views/reset_password_screen/reset_password_screen.dart';
//---- company ----
export 'package:tawzeef/views/company/home_screen/company_home_screen.dart';
export 'package:tawzeef/views/company/home_screen/company_fitler_screen.dart';
export 'package:tawzeef/views/company/drawer_screen/company_drawer_screen.dart';
export 'package:tawzeef/views/company/applicant_screen/applicant_screen.dart';
export 'package:tawzeef/views/company/company_notification_screen/company_notification_screen.dart';
export 'package:tawzeef/views/company/settings_screen/company_settings_screen.dart';
export 'package:tawzeef/views/company/my_job_screen/my_jobs_screen.dart';
export 'package:tawzeef/views/company/my_job_screen/my_job_screen_details.dart';
export 'package:tawzeef/views/company/job_applicants_screen/jop_applicants_screen.dart';
export 'package:tawzeef/views/company/add_job_screen/add_job_screen.dart';
export 'package:tawzeef/views/company/my_company_screen/my_company_screen.dart';
export 'package:tawzeef/views/company/edit_company_screen/add_links_screen.dart';
export 'package:tawzeef/views/company/edit_company_screen/edit_company_screen.dart';
export 'package:tawzeef/views/company/change_password_screen/company_change_password_screen.dart';
//---- officer ----
export 'package:tawzeef/views/officer/home_screen/officer_fitler_screen.dart';
export 'package:tawzeef/views/officer/home_screen/officer_home_screen.dart';
export 'package:tawzeef/views/officer/officer_notification_screen/officer_notification_screen.dart';
export 'package:tawzeef/views/officer/drawer_screen/officer_drawer_screen.dart';
export 'package:tawzeef/views/officer/profile_screen/my_profile_screen.dart';
export 'package:tawzeef/views/officer/saved_screen/saved_screen.dart';
export 'package:tawzeef/views/officer/my_applications_screen/my_application_screen.dart';
export 'package:tawzeef/views/officer/settings_screen/officer_settings_screen.dart';
export 'package:tawzeef/views/officer/change_password_screen/officer_change_password_screen.dart';
export 'package:tawzeef/views/officer/job_details_screen/job_screen_details.dart';
export 'package:tawzeef/views/officer/edit_profile_screen/edit_profile_screen.dart';
export 'package:tawzeef/views/officer/edit_profile_screen/edit_education_screen.dart';
export 'package:tawzeef/views/officer/job_details_screen/widgets/alert_successfully_item.dart';

//view models

//---- max company and offcier ----
export 'package:tawzeef/view_model/spalsh_screen_model/spalsh_screen_model.dart';
export 'package:tawzeef/view_model/login_type_screen_model/login_type_screen_model.dart';
export 'package:tawzeef/view_model/login_screen_model/login_screen_model.dart';
export 'package:tawzeef/view_model/register_screen_model/register_screen_model.dart';
export 'package:tawzeef/view_model/local_saving_data_model/local_saving_data_model.dart';
export 'package:tawzeef/view_model/settings_screen_model/settings_screen_model.dart';
export 'package:tawzeef/view_model/change_password_screen_model/change_password_screen_model.dart';
export 'package:tawzeef/view_model/fcm_notification_model/fcm_notification_model.dart';
export 'package:tawzeef/view_model/forget_password_model/forget_password_model.dart';
export 'package:tawzeef/view_model/reset_password_model/reset_password_model.dart';
export 'package:tawzeef/view_model/verify_code_model/verify_code_model.dart';
export 'package:tawzeef/view_model/url_model/url_model.dart';
//---- officer ----
export 'package:tawzeef/view_model/officer/officer_home_screen_model/officer_home_screen_model.dart';
export 'package:tawzeef/view_model/officer/edit_profile_screen_model/edit_profile_screen_model.dart';
export 'package:tawzeef/view_model/officer/edit_profile_screen_model/edit_education_screen_model.dart';
export 'package:tawzeef/view_model/officer/job_details_screen_model/job_details_screen_model.dart';
export 'package:tawzeef/view_model/officer/applying_jobs_screen_model/applying_jobs_screen_model.dart';
export 'package:tawzeef/view_model/officer/saving_jobs_screen_model/saving_jobs_screen_model.dart';
export 'package:tawzeef/view_model/officer/officer_drawer_screen_model/officer_drawer_screen_model.dart';
export 'package:tawzeef/view_model/officer/officer_notification_screen_model/officer_notification_screen_model.dart';

//---- company ----
export 'package:tawzeef/view_model/company/my_job_screen_model/my_job_item_model.dart';
export 'package:tawzeef/view_model/company/company_home_screen_model/company_home_screen_model.dart';
export 'package:tawzeef/view_model/company/add_job_screen_model/add_job_screen_model.dart';
export 'package:tawzeef/view_model/company/job_applicants_screen_model/job_applicants_screen_model.dart';
export 'package:tawzeef/view_model/company/edit_my_company_screen_model/edit_my_company_screen_model.dart';
export 'package:tawzeef/view_model/company/my_job_screen_model/my_job_screen_model.dart';
export 'package:tawzeef/view_model/company/company_drawer_screen_model/company_drawer_screen_model.dart';
export 'package:tawzeef/view_model/company/company_notification_screen_model/company_notification_screen_model.dart';
