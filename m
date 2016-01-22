Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aMZtV-0001Ih-LH
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jan 2016 06:28:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aMZtU-0001FP-08
	for qemu-trivial@nongnu.org; Fri, 22 Jan 2016 06:28:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aMZtT-0005kt-43
	for qemu-trivial@nongnu.org; Fri, 22 Jan 2016 06:28:43 -0500
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:38836)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1aMZtO-0005ji-PE; Fri, 22 Jan 2016 06:28:38 -0500
Received: by mail-wm0-x22c.google.com with SMTP id b14so127247844wmb.1;
	Fri, 22 Jan 2016 03:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=ghjk/l9H/Buum5rRjOKnp6yVzYdWGd3pRTqiTNQ7LYU=;
	b=AmO3+kCcjU4VqDjSN3aKSoUWiXTmUoVKDOmA5NS3xeKDGZAWl7rCBhABrw5E/WDpgl
	cmWPu2OhGHUrg4yGUCj+FTOwVjzgOTIt9wdIYZql5eA70MCUpK0mcMFqzj1NFqQSzshy
	jXyca4UHx6XOuxMIcbVX62Fz/orkN7DOPVzky3NGhPTR/i0yNsluyl29wz99a+TflGQ4
	wB5tou1A9ouHw5OtnuH8H5cXqbqLCqZgy+/YFsJfskqg35qviU5EvQDmx/p/cfCQddle
	UQ4MhBEWsWmD4OuaLiftfh8nt0XjYuvH1zOAkWcHR5OO3Peo+5MjS616Cy8ndVd8G7hZ
	mlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=ghjk/l9H/Buum5rRjOKnp6yVzYdWGd3pRTqiTNQ7LYU=;
	b=IU/hvCVOnCHrfMkd9w84T+6ewcKoJE22NzK2+dOtUBeiJUZJVtTv1sh96voA8q9sH0
	kGtYc5iI7rqOL4KkyzMhyj+Fq7SVarEjlBAl4xPNKEQO5eU+DcxW57SXfJRQTLVKaRe7
	4FycVVSuvEs33f6aJgWTSQr//7z1ZRgyMPWufFEa0m2j2RFpjNdTlzVehcEWXbTg0mp4
	rRp0dXq2Afuknjhuyi2IcDWMChp6c/kioVIXVN597tOAjlqP9txNAHM87wj3x/UeT7PA
	Q1fhNJfXos+2mlx+qRiNUv2Frae3u0xYuosBmSrBnTTcL/fSQR1TV+mkRPmY27NJESa+
	XIlA==
X-Gm-Message-State: AG10YOSuO1FNB/3spilJnU5DAVoKy5f16xSmPSIoFFWES7iUuHjJ0vLwEGHfGb+nx4RF1w==
X-Received: by 10.28.158.194 with SMTP id h185mr3175397wme.48.1453462118121;
	Fri, 22 Jan 2016 03:28:38 -0800 (PST)
Received: from donizetti.lan (94-39-152-208.adsl-ull.clienti.tiscali.it.
	[94.39.152.208])
	by smtp.gmail.com with ESMTPSA id x10sm5544363wjx.8.2016.01.22.03.28.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jan 2016 03:28:37 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 22 Jan 2016 12:28:33 +0100
Message-Id: <1453462113-27119-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22c
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] qemu-sockets: simplify error handling
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jan 2016 11:28:45 -0000

Just go always through the err label.  (Noticed because Coverity
complains that peer is always non-NULL in the error cleanup code,
but removing the "if" is arguably more prone to introducing the
opposite bug in the future).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-sockets.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index f455a17..a9fed00 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -464,7 +464,7 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
 
     if (err) {
         error_propagate(errp, err);
-        return -1;
+        goto err;
     }
 
     addr = sraddr->host;
@@ -474,13 +474,13 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
     }
     if (port == NULL || strlen(port) == 0) {
         error_setg(errp, "remote port not specified");
-        return -1;
+        goto err;
     }
 
     if (0 != (rc = getaddrinfo(addr, port, &ai, &peer))) {
         error_setg(errp, "address resolution failed for %s:%s: %s", addr, port,
                    gai_strerror(rc));
-	return -1;
+	goto err;
     }
 
     /* lookup local addr */
-- 
2.5.0


