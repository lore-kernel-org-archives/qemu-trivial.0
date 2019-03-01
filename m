Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzoDS-0006oY-Um
	for mharc-qemu-trivial@gnu.org; Fri, 01 Mar 2019 14:53:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mehta.aaru20@gmail.com>) id 1gzoDR-0006lp-2n
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2019 14:53:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mehta.aaru20@gmail.com>) id 1gzoDP-0002W2-0m
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2019 14:53:04 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:36712)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mehta.aaru20@gmail.com>)
	id 1gzoDD-0002Du-0k; Fri, 01 Mar 2019 14:52:53 -0500
Received: by mail-pf1-x443.google.com with SMTP id n22so11902827pfa.3;
	Fri, 01 Mar 2019 11:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:mime-version
	:content-transfer-encoding;
	bh=kGG0LRLZ7B+47isBFi6jk6Ut1LD6RwkA6x7luj99u60=;
	b=mx5AO/T68Jdt0w6RcyR3porr7cnfoPJKgBK8V2k+6GgjmMFwKXWcatmJfweU5a3xZF
	q78dgFqgjPNjDGry62KEh7wimUJOHDQZ93CUX14R9rav979io1Z1cuDRjoK7DlBY+DVz
	Jxi5frET1dd7uP419lWhy0QlQvuSg+Rhp6wqokA89SgayXUqKEwRdUjfE8QGgHjqgRnh
	ySyiMFdpQs2+isH133ld89UwIne1G9nmHqRIuWLtsZIXVoRGH6XnKVot1A/dyeJuqYHv
	9iAFi0OMgnh2n+rXJ82So1CB0KxYEJs2AneYiq5X2REx4yefxrV92IHvsIivhBdv3TUP
	UHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:mime-version
	:content-transfer-encoding;
	bh=kGG0LRLZ7B+47isBFi6jk6Ut1LD6RwkA6x7luj99u60=;
	b=EXHKROl2MUAMXWaPQ2unBdShjm5maGrH4Xdzf9Iw7lI4AEDm7vaWf9nijRX0ASeesb
	EltH0X5yXqrnmgivr78szqT6FJ7n6qOnmEn0F50zRz9mQhQLhof967QSH+ndYOI1tuSC
	gZS2YK/oOdl6xv7jci+CDw3mOBhvgXJY8WUdyJTIzZdaZ1JEVNSv4JdfUiRSN3c8vpSh
	ff6ldcsPK46TPYwhYQ1fi+Celkt5o7UyEgjtgWbrWwl0McrbsGPi517UpfvAbq6pvbPS
	V0NMo/omoLxs26SUaFOr5xwtIEThY6GlZznW375r3vcDnx53/zadrEyDFBOVWsPYCXSN
	vFRQ==
X-Gm-Message-State: APjAAAUcWZt0cV/mHNexyp0AuVCNjaC01KjXAlh5Yx8eJcVGkR0EkyTJ
	2kM75xf9jM+XqimLoYwrRXjOW5v+
X-Google-Smtp-Source: APXvYqwCOoJKajWnYf3BkRsLyoPkdRe55e5JFafKxSB1UmkWzmq94XLqpkqGt1D9trxdVQJwb6GZPA==
X-Received: by 2002:a63:3087:: with SMTP id w129mr6392831pgw.199.1551469968855;
	Fri, 01 Mar 2019 11:52:48 -0800 (PST)
Received: from am-swift ([2401:4900:3603:a697:15c2:ffc7:7bdd:cc06])
	by smtp.gmail.com with ESMTPSA id
	g71sm50569520pfg.157.2019.03.01.11.52.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Mar 2019 11:52:48 -0800 (PST)
Message-ID: <5310bd5d152fa36c1828a7cbd19fc893739d1609.camel@gmail.com>
From: Aarushi Mehta <mehta.aaru20@gmail.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, Stefan Hajnoczi
	<stefanha@gmail.com>, Julia Suvorova <jusual@mail.ru>, Julia Suvorova
	<jusual@mail.ru>
Date: Sat, 02 Mar 2019 01:22:29 +0530
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-trivial] [PATCH v4] thunk: fix of malloc to g_new
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
X-List-Received-Date: Fri, 01 Mar 2019 19:53:05 -0000

From 3c1cba63dc5070ab559a126e206557f27fbaea59 Mon Sep 17 00:00:00 2001
From: Aarushi Mehta <mehta.aaru20@gmail.com>
Date: Sat, 2 Mar 2019 01:11:42 +0530
Subject: [PATCH v4] thunk: fix of malloc to g_new

Note that since thunking occurs throughout the lifetime of the QEMU
instance, there is no matching 'free' to correct.

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 thunk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/thunk.c b/thunk.c
index d5d8645cd4..17f3d320bb 100644
--- a/thunk.c
+++ b/thunk.c
@@ -89,7 +89,7 @@ void thunk_register_struct(int id, const char *name, const argtype *types)
     for(i = 0;i < 2; i++) {
         offset = 0;
         max_align = 1;
-        se->field_offsets[i] = malloc(nb_fields * sizeof(int));
+        se->field_offsets[i] = g_new(int, nb_fields);
         type_ptr = se->field_types;
         for(j = 0;j < nb_fields; j++) {
             size = thunk_type_size(type_ptr, i);
-- 
2.17.1



