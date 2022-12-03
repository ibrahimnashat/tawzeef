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
export 'package:tawzeef/shared/consts/colors.dart';
export 'package:tawzeef/shared/consts/font_families.dart';
export 'package:tawzeef/shared/consts/font_sizes.dart';
export 'package:tawzeef/shared/consts/pngs.dart';
export 'package:tawzeef/shared/consts/spaces.dart';
export 'package:tawzeef/shared/consts/svgs.dart';
export 'package:tawzeef/shared/consts/url.dart';

//packages
export 'dart:io';
export 'dart:convert';
export 'package:flutter/material.dart';
export 'package:responsive_framework/responsive_framework.dart';
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

//models
export 'package:tawzeef/repository/models/objects/ad_model.dart';
export 'package:tawzeef/repository/models/objects/city_model.dart';
export 'package:tawzeef/repository/models/objects/country_model.dart';
export 'package:tawzeef/repository/models/objects/job_model.dart';
export 'package:tawzeef/repository/models/objects/job_title_model.dart';
export 'package:tawzeef/repository/models/objects/state_model.dart';
export 'package:tawzeef/repository/models/objects/career_level_model.dart';
export 'package:tawzeef/repository/models/objects/job_experience_model.dart';
export 'package:tawzeef/repository/models/objects/job_shift_model.dart';
export 'package:tawzeef/repository/models/objects/job_type_model.dart';
export 'package:tawzeef/repository/models/objects/user_model.dart';
export 'package:tawzeef/repository/models/objects/notification_model.dart';
export 'package:tawzeef/repository/models/objects/degree_level_model.dart';
export 'package:tawzeef/repository/models/objects/profile_education_model.dart';

//api
export 'package:tawzeef/repository/services/api.dart';

//request
export 'package:tawzeef/repository/models/requests/change_language_request.dart';
export 'package:tawzeef/repository/models/requests/get_career_level_request.dart';
export 'package:tawzeef/repository/models/requests/change_password_request.dart';
export 'package:tawzeef/repository/models/requests/add_job_request.dart';
export 'package:tawzeef/repository/models/requests/forget_password_request.dart';
export 'package:tawzeef/repository/models/requests/get_cities_request.dart';
export 'package:tawzeef/repository/models/requests/get_countries_request.dart';
export 'package:tawzeef/repository/models/requests/get_job_degree_levels_request.dart';
export 'package:tawzeef/repository/models/requests/get_job_experience_request.dart';
export 'package:tawzeef/repository/models/requests/get_job_shift_request.dart';
export 'package:tawzeef/repository/models/requests/job_title_list_request.dart';
export 'package:tawzeef/repository/models/requests/get_job_types_request.dart';
export 'package:tawzeef/repository/models/requests/get_states_request.dart';
export 'package:tawzeef/repository/models/requests/login_request.dart';
export 'package:tawzeef/repository/models/requests/register_request.dart';
export 'package:tawzeef/repository/models/requests/reset_password_request.dart';
export 'package:tawzeef/repository/models/requests/verify_code_request.dart';
export 'package:tawzeef/repository/models/requests/pharmacist_search_request.dart';
export 'package:tawzeef/repository/models/requests/apply_job_request.dart';
export 'package:tawzeef/repository/models/requests/edit_education_request.dart';
export 'package:tawzeef/repository/models/requests/edit_officer_profile_request.dart';
export 'package:tawzeef/repository/models/requests/applying_list_request.dart';
export 'package:tawzeef/repository/models/requests/job_request.dart';
export 'package:tawzeef/repository/models/requests/pharmacist_home_request.dart';
export 'package:tawzeef/repository/models/requests/get_pharmacist_notifciations_count_request.dart';
export 'package:tawzeef/repository/models/requests/get_pharmacist_notifciations_request.dart';
export 'package:tawzeef/repository/models/requests/save_job_request.dart';
export 'package:tawzeef/repository/models/requests/view_job_request.dart';
export 'package:tawzeef/repository/models/requests/change_user_application_status_request.dart';
export 'package:tawzeef/repository/models/requests/company_or_pharmacy_search_request.dart';
export 'package:tawzeef/repository/models/requests/edit_company_or_pharmacy_profile_request.dart';
export 'package:tawzeef/repository/models/requests/edit_job_request.dart';
export 'package:tawzeef/repository/models/requests/company_or_pharmacy_home_request.dart';
export 'package:tawzeef/repository/models/requests/get_company_or_pharmacy_notifciations_count_request.dart';
export 'package:tawzeef/repository/models/requests/get_company_or_pharmacy_notifciations_request.dart';
export 'package:tawzeef/repository/models/requests/get_my_jobs_request.dart';
export 'package:tawzeef/repository/models/requests/get_users_of_job_request.dart';
export 'package:tawzeef/repository/models/requests/saving_list_request.dart';

//response
export 'package:tawzeef/repository/models/responses/change_password_response.dart';
export 'package:tawzeef/repository/models/responses/get_career_level_response.dart';
export 'package:tawzeef/repository/models/responses/change_language_response.dart';
export 'package:tawzeef/repository/models/responses/forget_password_response.dart';
export 'package:tawzeef/repository/models/responses/add_job_response.dart';
export 'package:tawzeef/repository/models/responses/get_cities_response.dart';
export 'package:tawzeef/repository/models/responses/get_countries_response.dart';
export 'package:tawzeef/repository/models/responses/get_degree_levels_response.dart';
export 'package:tawzeef/repository/models/responses/get_job_expericence_response.dart';
export 'package:tawzeef/repository/models/responses/get_job_shift_response.dart';
export 'package:tawzeef/repository/models/responses/job_title_list_response.dart';
export 'package:tawzeef/repository/models/responses/get_job_types_response.dart';
export 'package:tawzeef/repository/models/responses/get_states_response.dart';
export 'package:tawzeef/repository/models/responses/login_response.dart';
export 'package:tawzeef/repository/models/responses/register_response.dart';
export 'package:tawzeef/repository/models/responses/reset_password_response.dart';
export 'package:tawzeef/repository/models/responses/verify_code_response.dart';
export 'package:tawzeef/repository/models/responses/pharmacist_search_response.dart';
export 'package:tawzeef/repository/models/responses/apply_job_response.dart';
export 'package:tawzeef/repository/models/responses/edit_education_response.dart';
export 'package:tawzeef/repository/models/responses/edit_pharmacist_profile_response.dart';
export 'package:tawzeef/repository/models/responses/applying_list_response.dart';
export 'package:tawzeef/repository/models/responses/job_response.dart';
export 'package:tawzeef/repository/models/responses/pharmacist_home_response.dart';
export 'package:tawzeef/repository/models/responses/get_pharmacist_notifications_count_response.dart';
export 'package:tawzeef/repository/models/responses/get_pharmacist_notifications_response.dart';
export 'package:tawzeef/repository/models/responses/save_job_response.dart';
export 'package:tawzeef/repository/models/responses/view_job_response.dart';
export 'package:tawzeef/repository/models/responses/change_user_application_status_response.dart';
export 'package:tawzeef/repository/models/responses/company_or_pharmacy_search_response.dart';
export 'package:tawzeef/repository/models/responses/edit_company_or_pharmacy_profile_response.dart';
export 'package:tawzeef/repository/models/responses/edit_job_response.dart';
export 'package:tawzeef/repository/models/responses/company_or_pharmacy_home_response.dart';
export 'package:tawzeef/repository/models/responses/get_company_or_pharmacy_notifications_count_response.dart';
export 'package:tawzeef/repository/models/responses/get_company_or_pharmacy_notifications_response.dart';
export 'package:tawzeef/repository/models/responses/get_my_job_list_response.dart';
export 'package:tawzeef/repository/models/responses/get_users_of_job_response.dart';
export 'package:tawzeef/repository/models/responses/saving_list_response.dart';

//services
export 'package:tawzeef/repository/services/verify_code_services.dart';
export 'package:tawzeef/repository/services/pharmacist_services/apply_job_services.dart';
export 'package:tawzeef/repository/services/pharmacist_services/get_job_services.dart';
export 'package:tawzeef/repository/services/pharmacist_services/view_job_services.dart';
export 'package:tawzeef/repository/services/pharmacist_services/get_saving_jobs_services.dart';
export 'package:tawzeef/repository/services/pharmacist_services/save_job_services.dart';
export 'package:tawzeef/repository/services/pharmacist_services/get_pharmacist_notifications_services.dart';
export 'package:tawzeef/repository/services/pharmacist_services/edit_pharmacist_profile_services.dart';
export 'package:tawzeef/repository/services/get_degree_levels_services.dart';
export 'package:tawzeef/repository/services/pharmacist_services/edit_education_services.dart';
export 'package:tawzeef/repository/services/pharmacist_services/get_applying_jobs_services.dart';
export 'package:tawzeef/repository/services/login_services.dart';
export 'package:tawzeef/repository/services/get_cities_services.dart';
export 'package:tawzeef/repository/services/get_countries_services.dart';
export 'package:tawzeef/repository/services/get_job_titles_services.dart';
export 'package:tawzeef/repository/services/get_states_services.dart';
export 'package:tawzeef/repository/services/pharmacist_services/get_pharmacist_home_jobs_services.dart';
export 'package:tawzeef/repository/services/pharmacist_services/pharmacist_search_jobs_services.dart';
export 'package:tawzeef/repository/services/company_or_pharmacy_services/add_job_services.dart';
export 'package:tawzeef/repository/services/company_or_pharmacy_services/edit_job_services.dart';
export 'package:tawzeef/repository/services/get_career_level_services.dart';
export 'package:tawzeef/repository/services/get_job_experience_services.dart';
export 'package:tawzeef/repository/services/get_job_shift_services.dart';
export 'package:tawzeef/repository/services/get_job_types_services.dart';
export 'package:tawzeef/repository/services/company_or_pharmacy_services/company_or_pharmacy_search_users_services.dart';
export 'package:tawzeef/repository/services/company_or_pharmacy_services/get_company_or_pharmacy_home_users_services.dart';
export 'package:tawzeef/repository/services/company_or_pharmacy_services/get_company_or_pharmacy_notifications_services.dart';
export 'package:tawzeef/repository/services/company_or_pharmacy_services/edit_company_or_pharmacy_profile_services.dart';
export 'package:tawzeef/repository/services/company_or_pharmacy_services/change_user_applying_status_services.dart';
export 'package:tawzeef/repository/services/company_or_pharmacy_services/get_users_of_job_services.dart';
export 'package:tawzeef/repository/services/company_or_pharmacy_services/get_my_jobs_services.dart';

//views
//---- max view of company or pharmacy and pharmacist ----
export 'package:tawzeef/views/splash_screen/splash_screen.dart';
export 'package:tawzeef/views/choose_language_screen/chooseLanguage_screen.dart';
export 'package:tawzeef/views/login_type_screen/login_type_screen.dart';
export 'package:tawzeef/views/login_screen/login_screen.dart';
export 'package:tawzeef/views/sign_up_screen/sign_up_screen.dart';
export 'package:tawzeef/views/verify_screen/verify_code_screen.dart';
export 'package:tawzeef/views/forget_password_screen/forget_password_screen.dart';
export 'package:tawzeef/views/reset_password_screen/reset_password_screen.dart';
//---- company ----
export 'package:tawzeef/views/company_or_pharmacy_veiw_section/comapny_or_pharmacy_home_screen/company_or_pharmacy_home_screen.dart';
export 'package:tawzeef/views/company_or_pharmacy_veiw_section/comapny_or_pharmacy_home_screen/company_or_pharmacy_fitler_screen.dart';
export 'package:tawzeef/views/company_or_pharmacy_veiw_section/comapny_or_pharmacy_drawer_screen/company_or_pharmacy_drawer_screen.dart';
export 'package:tawzeef/views/company_or_pharmacy_veiw_section/applicant_screen/applicant_screen.dart';
export 'package:tawzeef/views/company_or_pharmacy_veiw_section/company_or_pharmacy_notification_screen/company_or_pharmacy_notification_screen.dart';
export 'package:tawzeef/views/company_or_pharmacy_veiw_section/company_or_pharmacy_settings_screen/company_or_pharmacy_settings_screen.dart';
export 'package:tawzeef/views/company_or_pharmacy_veiw_section/my_job_screen/my_jobs_screen.dart';
export 'package:tawzeef/views/company_or_pharmacy_veiw_section/my_job_screen/my_job_screen_details.dart';
export 'package:tawzeef/views/company_or_pharmacy_veiw_section/job_applicants_screen/jop_applicants_screen.dart';
export 'package:tawzeef/views/company_or_pharmacy_veiw_section/add_job_screen/add_job_screen.dart';
export 'package:tawzeef/views/company_or_pharmacy_veiw_section/my_company_or_pharmacy_screen/my_company_or_pharmacy_screen.dart';
export 'package:tawzeef/views/company_or_pharmacy_veiw_section/edit_company_or_pharmacy_screen/add_links_screen.dart';
export 'package:tawzeef/views/company_or_pharmacy_veiw_section/edit_company_or_pharmacy_screen/edit_company_or_pharmacy_screen.dart';
export 'package:tawzeef/views/company_or_pharmacy_veiw_section/change_password_screen/company_change_password_screen.dart';
//---- officer ----
export 'package:tawzeef/views/pharmacist_view_section/pharmacist_home_screen/pharmacist_fitler_screen.dart';
export 'package:tawzeef/views/pharmacist_view_section/pharmacist_home_screen/pharmacist_home_screen.dart';
export 'package:tawzeef/views/pharmacist_view_section/pharmacist_notification_screen/pharmacist_notification_screen.dart';
export 'package:tawzeef/views/pharmacist_view_section/pharmacist_drawer_screen/pharmacist_drawer_screen.dart';
export 'package:tawzeef/views/pharmacist_view_section/profile_screen/my_profile_screen.dart';
export 'package:tawzeef/views/pharmacist_view_section/saved_screen/saved_screen.dart';
export 'package:tawzeef/views/pharmacist_view_section/my_applications_screen/my_application_screen.dart';
export 'package:tawzeef/views/pharmacist_view_section/pharmacist_settings_screen/pharmacist_settings_screen.dart';
export 'package:tawzeef/views/pharmacist_view_section/pharmacist_change_password_screen/pharmacist_change_password_screen.dart';
export 'package:tawzeef/views/pharmacist_view_section/job_details_screen/job_screen_details.dart';
export 'package:tawzeef/views/pharmacist_view_section/edit_profile_screen/edit_profile_screen.dart';
export 'package:tawzeef/views/pharmacist_view_section/edit_profile_screen/edit_education_screen.dart';
export 'package:tawzeef/views/pharmacist_view_section/job_details_screen/widgets/alert_successfully_item.dart';

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
export 'package:tawzeef/view_model/pharmacist_model_section/pharmacist_home_screen_model/pharmacist_home_screen_model.dart';
export 'package:tawzeef/view_model/pharmacist_model_section/edit_profile_screen_model/edit_profile_screen_model.dart';
export 'package:tawzeef/view_model/pharmacist_model_section/edit_profile_screen_model/edit_education_screen_model.dart';
export 'package:tawzeef/view_model/pharmacist_model_section/job_details_screen_model/job_details_screen_model.dart';
export 'package:tawzeef/view_model/pharmacist_model_section/applying_jobs_screen_model/applying_jobs_screen_model.dart';
export 'package:tawzeef/view_model/pharmacist_model_section/saving_jobs_screen_model/saving_jobs_screen_model.dart';
export 'package:tawzeef/view_model/pharmacist_model_section/pharmacist_drawer_screen_model/pharmacist_drawer_screen_model.dart';
export 'package:tawzeef/view_model/pharmacist_model_section/pharmacist_notification_screen_model/pharmacist_notification_screen_model.dart';

//---- company ----
export 'package:tawzeef/view_model/company_or_pharmacy_model_section/my_job_screen_model/my_job_item_model.dart';
export 'package:tawzeef/view_model/company_or_pharmacy_model_section/company_or_pharmacy_home_screen_model/company_or_pharmacy_home_screen_model.dart';
export 'package:tawzeef/view_model/company_or_pharmacy_model_section/add_job_screen_model/add_job_screen_model.dart';
export 'package:tawzeef/view_model/company_or_pharmacy_model_section/job_applicants_screen_model/job_applicants_screen_model.dart';
export 'package:tawzeef/view_model/company_or_pharmacy_model_section/edit_my_company_or_pharmacy_screen_model/edit_my_company_or_pharmacy_screen_model.dart';
export 'package:tawzeef/view_model/company_or_pharmacy_model_section/my_job_screen_model/my_job_screen_model.dart';
export 'package:tawzeef/view_model/company_or_pharmacy_model_section/company_or_pharmacy_drawer_screen_model/company_or_pharmacy_drawer_screen_model.dart';
export 'package:tawzeef/view_model/company_or_pharmacy_model_section/company_or_pharmacy_notification_screen_model/company_or_pharmacy_notification_screen_model.dart';
