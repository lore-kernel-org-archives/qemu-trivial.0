Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eGz9Y-0008GK-GT
	for mharc-qemu-trivial@gnu.org; Mon, 20 Nov 2017 22:23:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eGz9W-0008EM-6O
	for qemu-trivial@nongnu.org; Mon, 20 Nov 2017 22:23:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eGz9V-00005J-Ds
	for qemu-trivial@nongnu.org; Mon, 20 Nov 2017 22:23:14 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:43969)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eGz9Q-0008Vj-NH; Mon, 20 Nov 2017 22:23:08 -0500
Received: by mail-qt0-x241.google.com with SMTP id w10so5474609qtb.10;
	Mon, 20 Nov 2017 19:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8zC/uACWbZ01kDHH1uHz/LKDaO77goh0zFwao27J/R0=;
	b=l0L8HisSs2SO6ioxanff/LVz3K2+nQs6A1ia2oUfoQlxaK+k/4+QCiikywP0aYZutw
	NT8r+5wO5P2XFCL/5J3Hx89VtngY+7cYjI6zum7caucm6uO1jn+3RaPr2HR20jRNj8+u
	BNu8q/l3OhH3jjx90sZHEh2qKCG/i5ShFkOyg5DqIzoedi3y4e5qzQZyTcI/etiI2Zd/
	k/A5SxOFzlOO5996GlsVS8CHQfoVDZSYHIuKpZ4cRBFWSHdnBwzqjzUTC/4nAvzSeLig
	tfOjwIbH35dvDv4AuuL1QepQT7AZqQVD/XnREHq0yh7rwckywRW6QCsj46hckHLaZiye
	tDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=8zC/uACWbZ01kDHH1uHz/LKDaO77goh0zFwao27J/R0=;
	b=sZXAZDI67iQIuPTi1CdWLP2MPM02RKHTr14d0cL4XH5AJJJ8nNLP5EZ9O/WHun8Iyj
	Lc+UPdGgRF6m55qzP0yRoA0YT2G1kpPjOGqCvtwEVURPAqb/tLamKfcQqJO5w/sVFU9M
	FHZAcFu73GP5ru5SpasaIveBTjt8O9e+nCb1feXrS6xr154NvqYbxNQjFaoVDnu2+Sj4
	FCij7j/4m8rjlWi/wa+w9U9SZ6OTFJI5mzp0XIA1rzVrV5xIjQqp9bEEkLFnzjwI9yVc
	zHGW8KwmxWXlpFQ4oZzzZhgCVdWw/wAXeel8AwdYfu1s/vMOyxfRcoJZ1hxB73NisLd7
	XUvQ==
X-Gm-Message-State: AJaThX7nluQDuPVQouGuh5KvHnAcGyAIDeFaS2CiMYSD8aPgBo+lMHx7
	dJBnhPq0Z7Aa9mQ2LLJqyoM=
X-Google-Smtp-Source: AGs4zMayWD5W+Ea8bcRYw8bstR9feT6oGa34D/7mwhxHxSLYgwmOJ2wfQ91/U5tJqmVN/lov6C4KkA==
X-Received: by 10.200.46.55 with SMTP id r52mr25530221qta.304.1511234588200;
	Mon, 20 Nov 2017 19:23:08 -0800 (PST)
Received: from x1.lan (host99.190-139-18.telecom.net.ar. [190.139.18.99])
	by smtp.gmail.com with ESMTPSA id
	d205sm7982754qke.21.2017.11.20.19.23.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Nov 2017 19:23:07 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P . Berrange" <berrange@redhat.com>, Fam Zheng <famz@redhat.com>,
	Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Date: Tue, 21 Nov 2017 00:22:47 -0300
Message-Id: <20171121032247.14579-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH for-2.11] Makefile: add more targets to the
 UNCHECKED_GOALS rule
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
X-List-Received-Date: Tue, 21 Nov 2017 03:23:15 -0000

These targets don't need a full build of git submodules.
(See b8e535ae8af and eaa2ddbb767).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index adda3fb63e..5e8d79618c 100644
--- a/Makefile
+++ b/Makefile
@@ -6,7 +6,10 @@ BUILD_DIR=$(CURDIR)
 # Before including a proper config-host.mak, assume we are in the source tree
 SRC_PATH=.
 
-UNCHECKED_GOALS := %clean TAGS cscope ctags docker docker-% help
+UNCHECKED_GOALS := %clean TAGS cscope ctags dist \
+    html info pdf txt \
+    help check-help \
+    docker docker-% vm-test vm-build-%
 
 # All following code might depend on configuration variables
 ifneq ($(wildcard config-host.mak),)
-- 
2.15.0


