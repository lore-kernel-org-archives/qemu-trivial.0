Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UBPTR-00064X-3G
	for mharc-qemu-trivial@gnu.org; Fri, 01 Mar 2013 07:54:05 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1UBPTO-00064N-7j
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2013 07:54:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1UBPTM-0003YC-Tf
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2013 07:54:02 -0500
Received: from e9.ny.us.ibm.com ([32.97.182.139]:49074)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1UBPTM-0003Y2-QB
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2013 07:54:00 -0500
Received: from /spool/local
	by e9.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Fri, 1 Mar 2013 07:54:00 -0500
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
	by e9.ny.us.ibm.com (192.168.1.109) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 1 Mar 2013 07:53:56 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 568BD38C801C
	for <qemu-trivial@nongnu.org>; Fri,  1 Mar 2013 07:53:56 -0500 (EST)
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r21CruL1310272
	for <qemu-trivial@nongnu.org>; Fri, 1 Mar 2013 07:53:56 -0500
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	r21CrtHK019615
	for <qemu-trivial@nongnu.org>; Fri, 1 Mar 2013 09:53:55 -0300
Received: from [9.2.141.150] (k-d941e-10.watson.ibm.com [9.2.141.150])
	by d01av03.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r21CrtEZ019598; Fri, 1 Mar 2013 09:53:55 -0300
Message-ID: <5130A4E3.70003@linux.vnet.ibm.com>
Date: Fri, 01 Mar 2013 07:53:55 -0500
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: qemu-trivial@nongnu.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13030112-7182-0000-0000-0000059A0BB9
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.182.139
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [Qemu-trivial] [PATCH] Use qemu_open / qemu_close in rng backend
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
X-List-Received-Date: Fri, 01 Mar 2013 12:54:03 -0000

In the rng backend use qemu_open and qemu_close rather than POSIX 
open/close.

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>

diff --git a/backends/rng-random.c b/backends/rng-random.c
index 0d11088..acd20af 100644
--- a/backends/rng-random.c
+++ b/backends/rng-random.c
@@ -74,7 +74,7 @@ static void rng_random_opened(RngBackend *b, Error **errp)
          error_set(errp, QERR_INVALID_PARAMETER_VALUE,
                    "filename", "a valid filename");
      } else {
-        s->fd = open(s->filename, O_RDONLY | O_NONBLOCK);
+        s->fd = qemu_open(s->filename, O_RDONLY | O_NONBLOCK);

          if (s->fd == -1) {
              error_set(errp, QERR_OPEN_FILE_FAILED, s->filename);
@@ -130,7 +130,7 @@ static void rng_random_finalize(Object *obj)
      qemu_set_fd_handler(s->fd, NULL, NULL, NULL);

      if (s->fd != -1) {
-        close(s->fd);
+        qemu_close(s->fd);
      }

      g_free(s->filename);


