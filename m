Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cu4CA-00039x-Dv
	for mharc-qemu-trivial@gnu.org; Fri, 31 Mar 2017 17:34:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <momtchil@momtchev.com>) id 1ctyne-00047N-1w
	for qemu-trivial@nongnu.org; Fri, 31 Mar 2017 11:49:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <momtchil@momtchev.com>) id 1ctyna-00068E-RY
	for qemu-trivial@nongnu.org; Fri, 31 Mar 2017 11:49:18 -0400
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:38658)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <momtchil@momtchev.com>)
	id 1ctyna-00066b-Hm
	for qemu-trivial@nongnu.org; Fri, 31 Mar 2017 11:49:14 -0400
Received: by mail-wm0-x22e.google.com with SMTP id t189so2198483wmt.1
	for <qemu-trivial@nongnu.org>; Fri, 31 Mar 2017 08:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=momtchev.com; s=google;
	h=to:from:subject:message-id:date:user-agent:mime-version;
	bh=Ap8KMiq4b9ICeIa3mOXxzOeHRKGvdstrP4M4c0dqtdg=;
	b=iPlCsKD1eZeu8MsHqZ8GHhh3vl0++1NXaayGywjw7EUQaB+Y2IF/kPzcfhHBHLd4GM
	eefgtTPOAHzjFzrxqEML0xVyXgxsqLuaxtBTpmLSUQsVjXYSUyZEgrLTLgkrMMpku/06
	Ev+XC8F8VN+C60+EUvZjRJfRQyitl489h5V5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version;
	bh=Ap8KMiq4b9ICeIa3mOXxzOeHRKGvdstrP4M4c0dqtdg=;
	b=b8NfmDv1YuN9mEehuYOGNxHYjwed6mqYzt3FBi5aoeOeRa60LB6Fz3iMSu0F0OzPmN
	AXyq8KWksUSPV+Gph359U47zuwUj0PQoYWvGRl1y+t4thIb/+E/y1rRoqRQzJec6HA7u
	eav01ZdZtRKJAYEO54cHWwdluJ6Nkt4ADWM5r29/66hhaI4kioUxUqvGQtyPoOm1VOmI
	vBzsHWWqSLPF02/8j6QaDkqFeHsIp98gYYlBkIHono1HxJaJorWTnLu2RT2uVIA86+Y5
	ulslTFXl3tuI5HrvtZ4L78mv8GuFy7sdDe2Ip18i7E2F4jo+AKeIqeQIP7lBiFTntVw+
	Be/Q==
X-Gm-Message-State: AFeK/H0p++Ane8LwdaVchdi0V9R5wsFXA2vSm/wMfByY8diEZS+DZQvSerPGxqwvzNQlwQ==
X-Received: by 10.28.169.199 with SMTP id s190mr4022409wme.2.1490975352649;
	Fri, 31 Mar 2017 08:49:12 -0700 (PDT)
Received: from [192.168.0.134] ([88.191.245.37])
	by smtp.gmail.com with ESMTPSA id
	v186sm3371897wmv.2.2017.03.31.08.49.10 for <qemu-trivial@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 08:49:10 -0700 (PDT)
To: qemu-trivial@nongnu.org
From: Momtchil Momtchev <momtchil@momtchev.com>
Message-ID: <c0c4a64f-d2a0-684c-7614-890afb9a5740@momtchev.com>
Date: Fri, 31 Mar 2017 17:49:10 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------84B9000C3BD4DA28C75041DC"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22e
X-Mailman-Approved-At: Fri, 31 Mar 2017 17:34:57 -0400
Subject: [Qemu-trivial] qemu-img: Setting the VM Tools version when
 converting to VMDK format
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
X-List-Received-Date: Fri, 31 Mar 2017 15:49:19 -0000

This is a multi-part message in MIME format.
--------------84B9000C3BD4DA28C75041DC
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


     Hello,

     Here is a quick trivial patch that adds a command-line option to 
qemu-img convert to specify the VMWare Tools version used in the VMDK 
file. The VMWare Guest Customization feature and Vagrant depend on this 
option.

     We have lost so much time trying to understand that issue, that I 
am including the dreaded VMWare error message here so people can 
eventually google this patch via the mailing list.

"Customization of the guest operating system is not supported in this 
configuration. Microsoft Vista (TM) and Linux guests with Logical Volume 
Manager are supported only for recent ESX/ESXi host and VMware Tools 
versions. Refer to VMware vSphere documentation for supported 
configurations."

--
Momtchil Momtchev <momtchil@momtchev.com>



--------------84B9000C3BD4DA28C75041DC
Content-Type: text/plain; charset=UTF-8; x-mac-type="0"; x-mac-creator="0";
 name="qemu-2.8.0-vmtoolsversion.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="qemu-2.8.0-vmtoolsversion.patch"

diff -bur qemu-2.8.0-orig/block/vmdk.c qemu-2.8.0/block/vmdk.c
--- qemu-2.8.0-orig/block/vmdk.c	2016-12-20 21:16:43.000000000 +0100
+++ qemu-2.8.0/block/vmdk.c	2017-03-31 16:54:45.839124664 +0200
@@ -1857,6 +1857,8 @@
     char *adapter_type = NULL;
     char *backing_file = NULL;
     char *hw_version = NULL;
+    char *tools_version = NULL;
+    char *tools_version_header = NULL;
     char *fmt = NULL;
     int ret = 0;
     bool flat, split, compress;
@@ -1889,10 +1891,13 @@
         "#DDB\n"
         "\n"
         "ddb.virtualHWVersion = \"%s\"\n"
+        "%s"
         "ddb.geometry.cylinders = \"%" PRId64 "\"\n"
         "ddb.geometry.heads = \"%" PRIu32 "\"\n"
         "ddb.geometry.sectors = \"63\"\n"
         "ddb.adapterType = \"%s\"\n";
+    const char tools_version_template[] =
+        "ddb.toolsVersion = \"%s\"\n";
 
     ext_desc_lines = g_string_new(NULL);
 
@@ -1920,6 +1925,14 @@
         g_free(hw_version);
         hw_version = g_strdup("4");
     }
+    tools_version = qemu_opt_get_del(opts, BLOCK_OPT_TOOLSVERSION);
+    if (strcmp(tools_version, "undefined") == 0) {
+        tools_version_header = g_strdup("");
+    } else {
+        tools_version_header = g_strdup_printf(tools_version_template,
+                           tools_version);
+    }
+    g_free(tools_version);
     fmt = qemu_opt_get_del(opts, BLOCK_OPT_SUBFMT);
     if (qemu_opt_get_bool_del(opts, BLOCK_OPT_ZEROED_GRAIN, false)) {
         zeroed_grain = true;
@@ -2041,11 +2054,13 @@
                            parent_desc_line,
                            ext_desc_lines->str,
                            hw_version,
+                           tools_version_header,
                            total_size /
                                (int64_t)(63 * number_heads * BDRV_SECTOR_SIZE),
                            number_heads,
                            adapter_type);
     desc_len = strlen(desc);
+    g_free(tools_version_header);
     /* the descriptor offset = 0x200 */
     if (!split && !flat) {
         desc_offset = 0x200;
@@ -2323,6 +2338,12 @@
             .def_value_str = "undefined"
         },
         {
+            .name = BLOCK_OPT_TOOLSVERSION,
+            .type = QEMU_OPT_STRING,
+            .help = "VMWare Tools version",
+            .def_value_str = "undefined"
+        },
+        {
             .name = BLOCK_OPT_SUBFMT,
             .type = QEMU_OPT_STRING,
             .help =
diff -bur qemu-2.8.0-orig/include/block/block_int.h qemu-2.8.0/include/block/block_int.h
--- qemu-2.8.0-orig/include/block/block_int.h	2016-12-20 21:16:47.000000000 +0100
+++ qemu-2.8.0/include/block/block_int.h	2017-03-31 16:53:03.191125207 +0200
@@ -43,6 +43,7 @@
 #define BLOCK_OPT_ENCRYPT           "encryption"
 #define BLOCK_OPT_COMPAT6           "compat6"
 #define BLOCK_OPT_HWVERSION         "hwversion"
+#define BLOCK_OPT_TOOLSVERSION      "vmtoolsversion"
 #define BLOCK_OPT_BACKING_FILE      "backing_file"
 #define BLOCK_OPT_BACKING_FMT       "backing_fmt"
 #define BLOCK_OPT_CLUSTER_SIZE      "cluster_size"

--------------84B9000C3BD4DA28C75041DC--

