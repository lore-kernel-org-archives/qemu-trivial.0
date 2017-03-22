Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cqnC9-00041Y-MK
	for mharc-qemu-trivial@gnu.org; Wed, 22 Mar 2017 16:49:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cqnC7-0003zD-6m
	for qemu-trivial@nongnu.org; Wed, 22 Mar 2017 16:49:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cqnC6-0000XI-AI
	for qemu-trivial@nongnu.org; Wed, 22 Mar 2017 16:49:23 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:32944)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cqnC4-0000Wb-AV; Wed, 22 Mar 2017 16:49:20 -0400
Received: by mail-qt0-x243.google.com with SMTP id r45so26852597qte.0;
	Wed, 22 Mar 2017 13:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SqjCnCGnucxBra+5LhiSayVshgbtJGEVJX9iVTpgv6Y=;
	b=LSB+F7lNdHazkvvNi5CQ1OmFGw5fqQj52+qK+kjHtBuHQ149GNuqRZD1YejwIE78pk
	2ziSA6DkkRn64iUd/Tu/ElUTuK4z0+vGGTX1ZCY2YBWtkDM+WStAdB/BPUSdP8bblz6b
	qK7eSXYQ6iozSk2PLJSb3qvNvPhEzceJTS87JalZpb4DnN3Y1stD65KI72WJOibjut7T
	BNQA29wCIalzUIz2rjjvvzqfoj6GeXk3+221+/+Nb+TQI1de4O13kmyXn+6Hk1T7JHDr
	fJa3fDwEmZNBoh4udegVTHnDzgHKJyoEaTbWFEmoNrES74TEmNSpxbSoZSRWGadnt5n8
	3zKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=SqjCnCGnucxBra+5LhiSayVshgbtJGEVJX9iVTpgv6Y=;
	b=V3xTlq1pXfnWvhk897iw4N5uNEO7lL8WLpAlSsRdpf9TzormpBlscb72HXKEIKo0jt
	gulyfndeaLOhy+a/XIIVk57e2ryY2cxDqg2AbHGgpQbd1Zii8rMDxfZXOQTJUq5N4SaH
	S/1elMKDwQwKPQvX2Zue77zvf/KeCFdV3iQdXi6p1t7+ais9NgtoaADQ8h4gstFlqfAz
	fef3E9jpPTBK7C/G+0MlwMrzFUugme9PBb9R9MyuXEtcMywriAhobeSAZZTBQqwbASOj
	Fn2p9SOrnU9ihSguRhrjZjz1JtjwpGMS6HqSq0DM4fdHQ3cyP0jZerQrmrWl2Ixf3RSk
	bgOA==
X-Gm-Message-State: AFeK/H1/ZYShVCG1iV3BRD044lh1UhoAxg734vr87JgrOGAhkKOt7wfPIaJj1aqKjm+/1Q==
X-Received: by 10.200.50.231 with SMTP id a36mr43312296qtb.156.1490215759571; 
	Wed, 22 Mar 2017 13:49:19 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	u43sm1767263qtc.11.2017.03.22.13.49.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Mar 2017 13:49:19 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Roth <mdroth@linux.vnet.ibm.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alexander Graf <agraf@suse.de>, Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 22 Mar 2017 17:48:43 -0300
Message-Id: <20170322204844.446-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170322204844.446-1-f4bug@amsat.org>
References: <20170322204844.446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH RESEND 2/3] device_tree: fix compiler
 warnings (clang 5)
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
X-List-Received-Date: Wed, 22 Mar 2017 20:49:24 -0000

static code analyzer complain:

device_tree.c:155:18: warning: Null pointer passed as an argument to a 'nonnull' parameter
    while ((de = readdir(d)) != NULL) {
                 ^~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 device_tree.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/device_tree.c b/device_tree.c
index 6e06320830..a24ddff02b 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -148,6 +148,7 @@ static void read_fstree(void *fdt, const char *dirname)
     d = opendir(dirname);
     if (!d) {
         error_setg(&error_fatal, "%s cannot open %s", __func__, dirname);
+        return;
     }
 
     while ((de = readdir(d)) != NULL) {
-- 
2.11.0


