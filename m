Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bQEB1-0007yY-SW
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jul 2016 09:38:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fullmanet@gmail.com>) id 1bQ9ZC-00034O-LC
	for qemu-trivial@nongnu.org; Thu, 21 Jul 2016 04:42:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fullmanet@gmail.com>) id 1bQ9ZB-00045i-Of
	for qemu-trivial@nongnu.org; Thu, 21 Jul 2016 04:42:50 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:33352)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fullmanet@gmail.com>)
	id 1bQ9Yx-000440-VQ; Thu, 21 Jul 2016 04:42:36 -0400
Received: by mail-wm0-x243.google.com with SMTP id o80so1735219wme.0;
	Thu, 21 Jul 2016 01:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vDI4MUTU0Js4+UYmI+0Wxej6HX7KskjG5WfuF5U73go=;
	b=g0Y+NNx74HXl+e9Z2AddT+prhGJr32h/Dxsgi8zIv6yq5jMDAWc05gkPm69lSRP6Lo
	1m4nVW3bxp/kgIyD3pmuLjVbY38u9ltkeorXxlTVgNUCHISKrfjcjMqYm5MNiuh3GQw1
	27I5Qdkiuolyfp2CQAci4y7/NqQHJwst38heEBdIXQovtpZWl5IbgwqM4PWgQGHy9iTi
	uGVyp/rif5NtZ8q/Xe33RAtLKXsRFslMHZKvpQ2ohqQGzCF1hZqN+B14n3hy+6M2qolw
	cNnvQgAzb0XVxQ1gT6R4OElZIdErr4hp35F3NKRTykpgP/GILwDe9rSFviitTlFMwNno
	TbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vDI4MUTU0Js4+UYmI+0Wxej6HX7KskjG5WfuF5U73go=;
	b=kTwsV+WqhjxQhI9LDAXJpYTpFmF++JegYKBkBduDBbEzHX3VKcQQtPFher799unEe2
	hOfFp690pkX3twS+45Ra0/4mjUIFNpU75q0hdsQ4wLMoJPYmL3Woj0dz2Y2vGleCzA1z
	A/ItkhVftAKqG4HpzW3uhBNXgsAjNgNzlqPvIUxIV/8Ni06X1ow2RWjrsOXB6Uxhj5HM
	UhVfE8sPpmFtiviaI3+jJ3ihi0T0e3KmSXzYVvH5TYGSiOonJuvQ0uYM8bEHsT3bwHvD
	+aOYnu27JN93qsTvgi6mLyRHajnQ87kYtHAQ9hV7sf6D1lla48lLiWS1/3jqOnHN3jEH
	2/3w==
X-Gm-Message-State: ALyK8tINJIYEj6FFMGtBTo6oOC7uEW8pLnIJEUcD5s6rbHAhGrYC6OJ6yK4osfhDgLLxOw==
X-Received: by 10.28.144.5 with SMTP id s5mr15397393wmd.39.1469090555227;
	Thu, 21 Jul 2016 01:42:35 -0700 (PDT)
Received: from localhost.localdomain (ram94-2-82-66-69-246.fbx.proxad.net.
	[82.66.69.246])
	by smtp.gmail.com with ESMTPSA id e7sm5262999wjg.17.2016.07.21.01.42.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jul 2016 01:42:34 -0700 (PDT)
From: Reda Sallahi <fullmanet@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Fam Zheng <famz@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-trivial@nongnu.org,
	Reda Sallahi <fullmanet@gmail.com>
Date: Thu, 21 Jul 2016 10:41:53 +0200
Message-Id: <20160721084153.16103-1-fullmanet@gmail.com>
X-Mailer: git-send-email 2.9.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
X-Mailman-Approved-At: Thu, 21 Jul 2016 09:38:10 -0400
Subject: [Qemu-trivial] [PATCH] qemu-img: fix error messages emitted by
 img_open()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jul 2016 08:42:54 -0000

img_open_file() and img_open_opts() were printing error messages with a
duplicate part because of a wrong use of error_reportf_err() (e.g.
qemu-img: Could not open 'foo': Could not open 'foo': No such file or directory)

This change uses error_report_err() instead to eliminate the duplicate part.

Signed-off-by: Reda Sallahi <fullmanet@gmail.com>
---
 qemu-img.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index 2e40e1f..dc6652d 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -268,7 +268,7 @@ static BlockBackend *img_open_opts(const char *optstr,
     options = qemu_opts_to_qdict(opts, NULL);
     blk = blk_new_open(NULL, NULL, options, flags, &local_err);
     if (!blk) {
-        error_reportf_err(local_err, "Could not open '%s': ", optstr);
+        error_report_err(local_err);
         return NULL;
     }
     blk_set_enable_write_cache(blk, !writethrough);
@@ -295,7 +295,7 @@ static BlockBackend *img_open_file(const char *filename,
 
     blk = blk_new_open(filename, NULL, options, flags, &local_err);
     if (!blk) {
-        error_reportf_err(local_err, "Could not open '%s': ", filename);
+        error_report(local_err);
         return NULL;
     }
     blk_set_enable_write_cache(blk, !writethrough);
-- 
2.9.0


