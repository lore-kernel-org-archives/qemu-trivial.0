Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dqNDv-000748-Th
	for mharc-qemu-trivial@gnu.org; Fri, 08 Sep 2017 13:37:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNDu-00073O-Id
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:37:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNDq-0007F4-Lc
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:37:46 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:35878)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNDq-0007EX-HY; Fri, 08 Sep 2017 13:37:42 -0400
Received: by mail-qt0-x242.google.com with SMTP id 7so1945182qtz.3;
	Fri, 08 Sep 2017 10:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:mime-version:content-transfer-encoding;
	bh=hLFx0JnxUD1euytHMuKj3M5aCsMIUc4fzJk2c9/ut/g=;
	b=XF860BxLXV690GbO6iDr/pUjkUkAzbHf/Kdm7Dfvb1eGaWg4bXmzFhiZ1v2udYVgK7
	ZVya5LH702fQCNCKOIgGqKEfz33AYkWGR1CWslHolhP02K9QiviRN06K+wwzc71HVKt7
	z8nehU7zMDgsuNJa89xbGYrbVs6BJN+DvFzYFGNYsStAMeLJzEe4c5QiN+0iSlGfOxB8
	ww+qAhB6zU4YvODtwl+Tq2bvnZEiiSt4K0/hH2jlZpvILb4gaCpD+T0xBuD4/5t2oMRx
	Os7H4crqnp6rh98qw5lyIVLnDTxHiJUjeVxoEFR139b0TNzSfke7KeEyiE4V0kRfoxdA
	saqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:mime-version
	:content-transfer-encoding;
	bh=hLFx0JnxUD1euytHMuKj3M5aCsMIUc4fzJk2c9/ut/g=;
	b=jFnV/LUkJfV4LLUEk1o0kASnXj46IwuK/TUv0+HK1Aaq5cK/l24at6wJp2jmwqijLc
	Y8enfYi8Qs6XOPkjTrgMRkdC21iVrcnkViSQlHxNUsdTpQOnpt5XGMEp29lMAmc9i8yV
	OEAydf9CCXLDP/f5VKZ4eqk6zWgzaQMLOqplQsRhNqAAfLoq/cs+EIlIKsvjvqDmAJIX
	Uy3SPl3xZ79wRzWSBPB8LEK6XKRQdaftf7xgMP6ycZ4joW7BoZg3do+jKibruePz5TKe
	v6ZHbulel6bPeK6q02b6S5dw3Aqs05bTy2twNJyviAyPSEBDUDCBaq1uXszdz7PoyVPq
	RM6Q==
X-Gm-Message-State: AHPjjUiF9xn9Q66Z8fHgjaHpN5VcJbpD96tFsq6r0eTqiYhYQjFn2Rub
	tJhYsjKHPNJ9PK+Qm6/M8w==
X-Google-Smtp-Source: AOwi7QCYXZo64lpGPR216QG5yl5qowauAm9ytPUfWn5IusazEiGq1y5Hlp+Oe2RP1xG3siPqnQUesQ==
X-Received: by 10.200.55.83 with SMTP id p19mr4824710qtb.21.1504892261781;
	Fri, 08 Sep 2017 10:37:41 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id f4sm1605859qtg.35.2017.09.08.10.37.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 10:37:41 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Date: Fri,  8 Sep 2017 14:36:20 -0300
Message-Id: <20170908173632.6711-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908173632.6711-1-f4bug@amsat.org>
References: <20170908173632.6711-1-f4bug@amsat.org>
In-Reply-To: <20170908173146.6446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v3 03/15] MAINTAINERS: add missing entry for
 vhost
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
X-List-Received-Date: Fri, 08 Sep 2017 17:37:47 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fb93e4b554..afc0072a17 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1029,6 +1029,7 @@ vhost
 M: Michael S. Tsirkin <mst@redhat.com>
 S: Supported
 F: hw/*/*vhost*
+F: docs/interop/vhost-user.txt
 
 virtio
 M: Michael S. Tsirkin <mst@redhat.com>
-- 
2.14.1


