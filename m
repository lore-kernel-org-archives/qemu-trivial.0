Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6tFL-0001Y8-Hr
	for mharc-qemu-trivial@gnu.org; Tue, 02 Feb 2021 05:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6tFJ-0001XD-Pn
 for qemu-trivial@nongnu.org; Tue, 02 Feb 2021 05:49:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6tFG-0004nF-R6
 for qemu-trivial@nongnu.org; Tue, 02 Feb 2021 05:49:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612262956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=810wxp/9K6X+ioRQSFDs4FbQGo2HFJmLTPYdgC9Myro=;
 b=TOZOaKzAfg6j30TzX0BY6p664AyaNpfFW4o6NTsRmymp/11RRKaFFbNXsb0WBrpqTp85v7
 CxV2L2sapoWIX/s+Mn2NzjnkCeF7jWS16JRDF1yYuLf5Pkx6reJ5FFFjOVrdyO+/ETGT/s
 tfpTXPbVfNP5iO25Ig7qgoZGDDLl3MI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-lJFSwa3XO2uLB3gMy0vxsg-1; Tue, 02 Feb 2021 05:49:15 -0500
X-MC-Unique: lJFSwa3XO2uLB3gMy0vxsg-1
Received: by mail-wr1-f71.google.com with SMTP id e15so12263651wrm.13
 for <qemu-trivial@nongnu.org>; Tue, 02 Feb 2021 02:49:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=810wxp/9K6X+ioRQSFDs4FbQGo2HFJmLTPYdgC9Myro=;
 b=a036wKO8M9zw1AsPCn6BhngmOsNU1XWbTgY6ei7QGtEPQpre8K2na9UJaXOD3hhUxi
 kJpkVRDIfWAanjBLPykQo7bRwr1kLDFABbFxF+Fw12mP7kMjI3aKWSSVkGA3tUPy3y31
 wCCL3mWXSdruke7MhnBcl5Djl7YAhET3Hp9DkFD3WZURuBLJr6DyZY/xEGzCBxtO1jMm
 8a8MfThoJUvuxOxWNEhNy7MN0HO29Rf+CwGX25ktCfqdZN18yIYHoyK4YTyotoadcAXP
 bpI+4Glf0ONHp2WKMEqBQG/G2jEWVNYmXGLkXKFwq/hq0qJmdu02/rOjjXBvmnATXJA8
 ZpEQ==
X-Gm-Message-State: AOAM531B+GAgXknUqcV1KsB5SdPEQ5QKYCoY5hM6oKZAPjUk7bVD0QKk
 iHYyS9Q0mrEMWS3rwuP0/OW9QDebvk8Vjm0yynJkLPRTRU8fF4QeSd7rrKAOfmp4GYM2wQvoYFy
 DBelWSW4KgNWsNbri9Q==
X-Received: by 2002:adf:e404:: with SMTP id g4mr22753051wrm.416.1612262954197; 
 Tue, 02 Feb 2021 02:49:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQxPqTSDYwGVplBMIqLnkYUj8GUcId3gYNhdRUrynVDOH+BZvSLM6qal70AIANGssvgKvbvQ==
X-Received: by 2002:adf:e404:: with SMTP id g4mr22753011wrm.416.1612262953816; 
 Tue, 02 Feb 2021 02:49:13 -0800 (PST)
Received: from x1w.redhat.com (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id l11sm29712075wrt.23.2021.02.02.02.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 02:49:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] configure: Escape non-numbers in version_ge()
Date: Tue,  2 Feb 2021 11:49:11 +0100
Message-Id: <20210202104911.879393-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Feb 2021 10:49:22 -0000

On Red Hat based distributions, the configure script emits various
warnings:

  # ./configure
  Using './build' as the directory for build output
  ./configure: line 212: test: 2-15: integer expression expected
  ./configure: line 213: test: 2-15: integer expression expected
  ./configure: line 212: test: el8: integer expression expected
  ./configure: line 213: test: el8: integer expression expected

This is produced by the gdb version check introduced in commit
b1863ccc957 ("configure: gate our use of GDB to 8.3.1 or above"):

    gdb_version=$($gdb_bin --version | head -n 1)
    if version_ge ${gdb_version##* } 8.3.1; then
        echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
    fi

Because on RHEL/Fedora the minor version is not a plain number:

  $ gdb --version | head -n 1
  GNU gdb (GDB) Fedora 9.1-7.fc32

  $ gdb --version | head -n 1
  GNU gdb (GDB) Red Hat Enterprise Linux 8.2-15.el8

Fix by only using the leading numbers, stripping the rest.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index e85d6baf8f8..21f6530a812 100755
--- a/configure
+++ b/configure
@@ -205,7 +205,7 @@ version_ge () {
         local_first=${2-0}
         # 'shift 2' if $2 is set, or 'shift' if $2 is not set
         shift ${2:+2}
-        local_ver1=$*
+        local_ver1=$(echo $* | sed -E 's/(^[0-9]+).*/\1/')
         set x $local_ver2
         # the second argument finished, the first must be greater or equal
         test $# = 1 && return 0
-- 
2.26.2


