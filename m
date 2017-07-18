Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLt7-0002Hk-PN
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:21:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLt3-0002E9-6R
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLt2-0001ak-Fl
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:37 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:33876)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLt2-0001aM-BN; Tue, 18 Jul 2017 02:21:36 -0400
Received: by mail-qt0-x241.google.com with SMTP id 19so1352515qty.1;
	Mon, 17 Jul 2017 23:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pZHSt1hH1+s42g1hyxp1EUwGxT5lC542JFIQ26i8S0Y=;
	b=viAE7W3pdAem/aTXeGLGGOAQlqMG4JHxIsmOYL2ZhZLKXsLhQUZfjFZl9v+wOmPmW3
	UeIWjABXmo4MJ9wE5jqH+u0KvofEImW9zQtS0RGMkXpHnxDLBGkx5gzfaYy4CThJOb1G
	omVZZTTOW9kp++rQkGMezU2+Ql5Z7Fwtu0nuNdktFE4f/ayR/3HHc6Duj9k2PhulOpiL
	AtzzyuI1u48y7zl818b+dS2WG6DZKuhHH3GdEVqHPgsgXJBWnfqaitvqO/mdQP+EW4w/
	G2Aevx7eUzm6eKT8J5QSgR8t7FtPnEhgQfKA4N4dJHtgkyziJDvLkSawLSZYmQ7h/7dr
	0v/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=pZHSt1hH1+s42g1hyxp1EUwGxT5lC542JFIQ26i8S0Y=;
	b=sG8wsgzHVqHPl/ghUu0lj0C4VyXqYiFmoHxa5fpf9LSe6SnfMs0bLM9WZzqjyNoocJ
	CHvj1DCkNtddLqbUCVQUst5O885NzLUdY+2EAN/hbKu1jg2foI07C/JIjLYddxAeX1JS
	WMWOzdSger3M+VhBG6lvERUFesU+BQyXsOyXw+sV+0hkKBqCg72lxH85x/Rqx1G0jWTX
	UOYf8ES73Wmaid9It0nChC3ZsfaVIllrLnj80G/6oDUllYckqx0yisRyRvDOyPuSpgC0
	sYRzG95oukt8xVYFm0kgDmXGh4DcP6XngQH3YWg7Fk8lO8iHhHROiyUb1N4hyNZXSxia
	gf4w==
X-Gm-Message-State: AIVw1107z9Fc2NN9zPu0XM7FRjCGB8qR+QyQLHFIMiuycSErBnxYDPTz
	fO0ljOYXTA/Ct56P9CLNFQ==
X-Received: by 10.237.45.194 with SMTP id i60mr26603qtd.121.1500358895779;
	Mon, 17 Jul 2017 23:21:35 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.21.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:21:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Date: Tue, 18 Jul 2017 03:10:00 -0300
Message-Id: <20170718061005.29518-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 24/29] tests/acpi: use ARRAY_SIZE macro
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
X-List-Received-Date: Tue, 18 Jul 2017 06:21:38 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acpi-utils.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/acpi-utils.h b/tests/acpi-utils.h
index f8d87236c6..91ee0a273d 100644
--- a/tests/acpi-utils.h
+++ b/tests/acpi-utils.h
@@ -58,7 +58,7 @@ typedef struct {
     } while (0);
 
 #define ACPI_READ_ARRAY(arr, addr)                               \
-    ACPI_READ_ARRAY_PTR(arr, sizeof(arr) / sizeof(arr[0]), addr)
+    ACPI_READ_ARRAY_PTR(arr, ARRAY_SIZE(arr), addr)
 
 #define ACPI_READ_TABLE_HEADER(table, addr)                      \
     do {                                                         \
-- 
2.13.2


