Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rOELg-00046k-2I
	for mharc-qemu-trivial@gnu.org; Fri, 12 Jan 2024 05:01:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rOELe-00045Y-Cc
 for qemu-trivial@nongnu.org; Fri, 12 Jan 2024 05:01:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rOELb-0005d7-QK
 for qemu-trivial@nongnu.org; Fri, 12 Jan 2024 05:01:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705053667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d4i9ybCEKfWI7bat3jDhZCQiNSkA8c2SdRIVc4iohQk=;
 b=OhFzbOSFzpug1/Psx2E2ezzaSJsWv4hDjojUAneY+2SUj3fn93+5i7jmTitZr1PpNrwW13
 HWs670xYSWpcLM+SLon5IVhf+xv7G63jo3YQ5q+a+cH6lQNaFPr8D3H21vdHBsiMMpZ3e3
 o4K3H5oFjHDzZd/M03uN9N2huOGzkRI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-471-9UZpRvMqNuGDoT6tnU-qeQ-1; Fri,
 12 Jan 2024 05:01:03 -0500
X-MC-Unique: 9UZpRvMqNuGDoT6tnU-qeQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 775F13C025B7;
 Fri, 12 Jan 2024 10:01:03 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.194.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F1CDC08ED4;
 Fri, 12 Jan 2024 10:01:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: [PATCH 1/5] qemu-options: Remove the deprecated -no-hpet option
Date: Fri, 12 Jan 2024 11:00:55 +0100
Message-ID: <20240112100059.965041-2-thuth@redhat.com>
In-Reply-To: <20240112100059.965041-1-thuth@redhat.com>
References: <20240112100059.965041-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.467,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Jan 2024 10:01:10 -0000

It's been marked as deprecated since QEMU 8.0, so it should be fine
to remove this now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst       | 6 ------
 docs/about/removed-features.rst | 8 ++++++++
 system/vl.c                     | 4 ----
 qemu-options.hx                 | 7 -------
 4 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 7fdd2239b4..6c668b8531 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -63,12 +63,6 @@ as short-form boolean values, and passed to plugins as ``arg_name=on``.
 However, short-form booleans are deprecated and full explicit ``arg_name=on``
 form is preferred.
 
-``-no-hpet`` (since 8.0)
-''''''''''''''''''''''''
-
-The HPET setting has been turned into a machine property.
-Use ``-machine hpet=off`` instead.
-
 ``-no-acpi`` (since 8.0)
 ''''''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index f04036987b..52d240ade9 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -460,6 +460,14 @@ in this case.
 Note that the default audio backend must be configured on the command
 line if the ``-nodefaults`` options is used.
 
+``-no-hpet`` (removed in 9.0)
+'''''''''''''''''''''''''''''
+
+The HPET setting has been turned into a machine property.
+Use ``-machine hpet=off`` instead.
+
+
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
diff --git a/system/vl.c b/system/vl.c
index 53850a1daf..f08c4c8193 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -3373,10 +3373,6 @@ void qemu_init(int argc, char **argv)
                 warn_report("-no-acpi is deprecated, use '-machine acpi=off' instead");
                 qdict_put_str(machine_opts_dict, "acpi", "off");
                 break;
-            case QEMU_OPTION_no_hpet:
-                warn_report("-no-hpet is deprecated, use '-machine hpet=off' instead");
-                qdict_put_str(machine_opts_dict, "hpet", "off");
-                break;
             case QEMU_OPTION_no_reboot:
                 olist = qemu_find_opts("action");
                 qemu_opts_parse_noisily(olist, "reboot=shutdown", false);
diff --git a/qemu-options.hx b/qemu-options.hx
index b66570ae00..57e447065a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2654,13 +2654,6 @@ SRST
     machine only).
 ERST
 
-DEF("no-hpet", 0, QEMU_OPTION_no_hpet,
-    "-no-hpet        disable HPET\n", QEMU_ARCH_I386)
-SRST
-``-no-hpet``
-    Disable HPET support. Deprecated, use '-machine hpet=off' instead.
-ERST
-
 DEF("acpitable", HAS_ARG, QEMU_OPTION_acpitable,
     "-acpitable [sig=str][,rev=n][,oem_id=str][,oem_table_id=str][,oem_rev=n][,asl_compiler_id=str][,asl_compiler_rev=n][,{data|file}=file1[:file2]...]\n"
     "                ACPI table description\n", QEMU_ARCH_I386)
-- 
2.43.0


