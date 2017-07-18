Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLsy-00029D-M4
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:21:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsu-00026Q-Ma
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLst-0001Ja-Tw
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:28 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33869)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLst-0001JF-Pw; Tue, 18 Jul 2017 02:21:27 -0400
Received: by mail-qt0-x242.google.com with SMTP id 19so1352315qty.1;
	Mon, 17 Jul 2017 23:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/CA7NWKYdKJ+KI3ooEDtsm/4OeiMB2fARutvIN/0SsQ=;
	b=p5+hKZNqrcoPEctQZeUAyUPlpCEqkDmjIirxdVIycaCKFp/WNIL1q2FWslGpWpIG0q
	JQyAgTtYKJ77AE8KGhteK4qfwczchZEqurIPBCVL2boW6V9ME+6AScgBZO45zZWT7S6h
	mVKHEC4O1DYS+lNjwCYyTISZ/HwmV2ojaaGbARbyPPcR8zLYx+Tv7Fzp5nSdp2ZrkuLK
	AyPlMhgjHd6Jl8sRMnCrYG47IMxq8fo54UEif500whGGY9KztjojK+t5L/UYjHz8Nft/
	YgF421CH8GGjNKzfcuFOGZn86lyy7tqhoHrKUVv4Hh10OlFtpd8NZWxAUpNNLDJ6PIgH
	lUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=/CA7NWKYdKJ+KI3ooEDtsm/4OeiMB2fARutvIN/0SsQ=;
	b=F43zczSK8/fxnecwJEQML/N/FP7CaNh4vOY7GWy50s8T8I9wJwYAB2VIihcacgKF+n
	RPgpAOwv5JiXI1vTW4d429/87nWDVLzCgPGPTrPcv4TnAaOg8IicOulrHnChHutdRQkc
	rZequxKb9RjxW+VehfZqk75NqWwrIkK6LnpyHmhMJg4acMJ8QpmAdx5QkPRXe5ji0UAS
	6jfN5AQt+2Rv15i93UvdLDjHl2M5RCcQLz8raXOvSXMcLhCTV7t0O0Kpam3JRZMe+yea
	xD5jNEgs3TFn9RG72GRJ0qYvbREbfEJnXQJyNVmn0+uS1rgFjMJ9JDJXh0VX8pHHm6k9
	10aQ==
X-Gm-Message-State: AIVw113YIHMCzGG+OaeTr5JvJro0vEPcGpwkVdTJ4uEh/Fzl/ZmmfCZm
	wGCz0jY46El1x7bHzAJ4ZQ==
X-Received: by 10.237.38.71 with SMTP id z65mr93553qtc.21.1500358887247;
	Mon, 17 Jul 2017 23:21:27 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.21.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:21:26 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Michael Roth <mdroth@linux.vnet.ibm.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Date: Tue, 18 Jul 2017 03:09:57 -0300
Message-Id: <20170718061005.29518-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 21/29] qga: use ARRAY_SIZE macro
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
X-List-Received-Date: Tue, 18 Jul 2017 06:21:30 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 qga/commands-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index d8e412275e..2a5d5cb4ba 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -896,7 +896,7 @@ static void build_guest_fsinfo_for_real_device(char const *syspath,
     if (p && sscanf(q, "%u", &host) == 1) {
         has_host = true;
         nhosts = build_hosts(syspath, p, has_ata, hosts,
-                             sizeof(hosts) / sizeof(hosts[0]), errp);
+                             ARRAY_SIZE(hosts), errp);
         if (nhosts < 0) {
             goto cleanup;
         }
-- 
2.13.2


