
GRANT ALL PRIVILEGES  ON furthered.* TO 'furthered'@'%' IDENTIFIED BY 'WY6dfWI&MQL*#';

INSERT INTO `sites` (`name`, `partner_id`, `logo`, `url`, `url_type`, `tagline`, `homepage`, `support_email`, `streaming_app_id`, `public`, `created_at`, `updated_at`) VALUES ('Docker', 28, 'furthered_logo-1362086662-1362167859.jpg', 'docker', 'sub', NULL, '/cle/index.php', 'support@furthered.com', 5, 0, NOW(), NOW());
    
INSERT INTO `site_profession` (`site_id`, `profession_id`, `primary`, `created_at`, `updated_at`) VALUES ((SELECT sites.id FROM `sites` WHERE sites.url = 'docker'), '2', '1', NOW(), NOW());

INSERT INTO `offer_site` (`offer_id`, `site_id`, `default`, `created_at`, `updated_at`, `deleted_at`) VALUES (1907, (SELECT sites.id FROM `sites` WHERE sites.url = 'docker'), 1, NOW(), NOW(), NULL);
​
INSERT INTO `site_settings` (`site_id`, `key`, `value`, `created_at`, `updated_at`, `deleted_at`) VALUES ((SELECT sites.id FROM `sites` WHERE sites.url = 'docker'), 'linkedin_url', 'https://www.linkedin.com/company/lawline.com', NOW(), NOW(), NULL);


