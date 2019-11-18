Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iWoDM-0000tn-GP
	for mharc-qemu-trivial@gnu.org; Mon, 18 Nov 2019 16:05:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33984)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iWoDG-0000k3-P7
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 16:05:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iWoDC-0000S1-QA
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 16:05:34 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59720
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iWoDC-0000RR-Ll
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 16:05:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574111130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qM1nb36WuoLn5iPpv5w4jChgKX8iZnVU50qCjKMKGUE=;
 b=OkzQ0IpitUwU7yjpmdh2Lm2W3BVpxTp2VDsDeNuwkIrRkrc8wtED3CfPIr88qJqUTkBO5I
 3cjWgYj85iQ329aF3T+kd5l7m8YJmc4QNx7FfkZloOPkK0D7Cd2fF0dE/moH7lIhZXQepR
 qwpwTFOl+npNMvPfjC8hrqikM0UMNL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-znd8cBw2N-KFvJlsNK483w-1; Mon, 18 Nov 2019 16:05:29 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDDBA1802CEB;
 Mon, 18 Nov 2019 21:05:27 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAA7960BE2;
 Mon, 18 Nov 2019 21:05:21 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Eric Blake <eblake@redhat.com>,
	qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>, qemu-trivial@nongnu.org
Subject: [PATCH-for-4.2 v3 3/3] trace: Forbid dynamic field width in event
 format
Date: Mon, 18 Nov 2019 22:04:58 +0100
Message-Id: <20191118210458.11959-4-philmd@redhat.com>
In-Reply-To: <20191118210458.11959-1-philmd@redhat.com>
References: <20191118210458.11959-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: znd8cBw2N-KFvJlsNK483w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Mon, 18 Nov 2019 21:05:39 -0000

Since not all trace backends support dynamic field width in
format (dtrace via stap does not), forbid them.

Add a check to refuse field width in new formats:

  $ make
  [...]
    GEN     hw/block/trace.h
  Traceback (most recent call last):
    File "scripts/tracetool.py", line 152, in <module>
      main(sys.argv)
    File "scripts/tracetool.py", line 143, in main
      events.extend(tracetool.read_events(fh, arg))
    File "scripts/tracetool/__init__.py", line 371, in read_events
      event =3D Event.build(line)
    File "scripts/tracetool/__init__.py", line 285, in build
      raise ValueError("Event format must not contain field width '%*'")
  ValueError: Error at hw/block/trace-events:11: Event format must not cont=
ain field width '%*'

Reported-by: Eric Blake <eblake@redhat.com>
Buglink: https://bugs.launchpad.net/qemu/+bug/1844817
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v3:
- use better regex provided by Eric,
- instead of re.match(), use re.search() which takes unanchored regex,
- added a comment in tracing.txt
---
 docs/devel/tracing.txt        | 3 ++-
 scripts/tracetool/__init__.py | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/docs/devel/tracing.txt b/docs/devel/tracing.txt
index 8c0376fefa..6c01ce801e 100644
--- a/docs/devel/tracing.txt
+++ b/docs/devel/tracing.txt
@@ -113,7 +113,8 @@ Format strings should reflect the types defined in the =
trace event.  Take
 special care to use PRId64 and PRIu64 for int64_t and uint64_t types,
 respectively.  This ensures portability between 32- and 64-bit platforms.
 Format strings must not end with a newline character.  It is the responsib=
ility
-of backends to adapt line ending for proper logging.
+of backends to adapt line ending for proper logging.  Format strings must =
not
+use numeric field width dynamic precision (SystemTap does not support them=
).
=20
 Each event declaration will start with the event name, then its arguments,
 finally a format string for pretty-printing. For example:
diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.py
index 44c118bc2a..ec7fe9fa4a 100644
--- a/scripts/tracetool/__init__.py
+++ b/scripts/tracetool/__init__.py
@@ -206,6 +206,7 @@ class Event(object):
                       "\s*"
                       "(?:(?:(?P<fmt_trans>\".+),)?\s*(?P<fmt>\".+))?"
                       "\s*")
+    _DFWRE =3D re.compile(r"%[\d\.\- +#']*\*") # dynamic width precision
=20
     _VALID_PROPS =3D set(["disable", "tcg", "tcg-trans", "tcg-exec", "vcpu=
"])
=20
@@ -280,6 +281,8 @@ class Event(object):
         if fmt.endswith(r'\n"'):
             raise ValueError("Event format must not end with a newline "
                              "character")
+        if Event._DFWRE.search(fmt):
+            raise ValueError("Event format must not contain field width '%=
*'")
=20
         if len(fmt_trans) > 0:
             fmt =3D [fmt_trans, fmt]
--=20
2.21.0


