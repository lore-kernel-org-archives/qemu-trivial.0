Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gUvWm-0006U3-5j
	for mharc-qemu-trivial@gnu.org; Thu, 06 Dec 2018 10:25:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47401)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gUvWh-0006Es-2J
	for qemu-trivial@nongnu.org; Thu, 06 Dec 2018 10:25:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gUvQh-0007kk-Rp
	for qemu-trivial@nongnu.org; Thu, 06 Dec 2018 10:19:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44980)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gUvQd-0007em-D2; Thu, 06 Dec 2018 10:19:03 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7B9C69B302;
	Thu,  6 Dec 2018 15:19:02 +0000 (UTC)
Received: from red.redhat.com (ovpn-125-104.rdu2.redhat.com [10.10.125.104])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D64387F1A7;
	Thu,  6 Dec 2018 15:19:00 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	qemu-trivial@nongnu.org,
	vsementsov@virtuozzo.com
Date: Thu,  6 Dec 2018 09:18:56 -0600
Message-Id: <20181206151856.77503-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 06 Dec 2018 15:19:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] cutils: Assert in-range base for
 string-to-integer conversions
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
X-List-Received-Date: Thu, 06 Dec 2018 15:25:23 -0000

POSIX states that the value of endptr is unspecified if strtol()
fails with EINVAL due to an invalid base argument.  Since none of
the callers to check_strtox_error() initialized endptr, we could
end up propagating uninitialized data back to a caller on error.
However, passing an out-of-range base is already a sign of poor
programming, so let's just assert that base is in range, at which
point check_strtox_error() can be tightened to assert that it is
receiving an initialized ep that points somewhere within the
caller's original string, regardless of whether strto*() succeeded
or failed with ERANGE.

Reported-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---

Also tested that this does not negatively impact David's pending
additions of qemu_strtod{,_finite}().  Thus:
Based-on: <20181121164421.20780-1-david@redhat.com>

 util/cutils.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/util/cutils.c b/util/cutils.c
index 91930d1bbeb..e098debdc0c 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -278,6 +278,7 @@ int qemu_strtosz_metric(const char *nptr, const char **end, uint64_t *result)
 static int check_strtox_error(const char *nptr, char *ep,
                               const char **endptr, int libc_errno)
 {
+    assert(ep >= nptr);
     if (endptr) {
         *endptr = ep;
     }
@@ -325,6 +326,7 @@ int qemu_strtoi(const char *nptr, const char **endptr, int base,
     char *ep;
     long long lresult;

+    assert((unsigned) base <= 36 && base != 1);
     if (!nptr) {
         if (endptr) {
             *endptr = nptr;
@@ -377,6 +379,7 @@ int qemu_strtoui(const char *nptr, const char **endptr, int base,
     char *ep;
     long long lresult;

+    assert((unsigned) base <= 36 && base != 1);
     if (!nptr) {
         if (endptr) {
             *endptr = nptr;
@@ -433,6 +436,7 @@ int qemu_strtol(const char *nptr, const char **endptr, int base,
 {
     char *ep;

+    assert((unsigned) base <= 36 && base != 1);
     if (!nptr) {
         if (endptr) {
             *endptr = nptr;
@@ -475,6 +479,7 @@ int qemu_strtoul(const char *nptr, const char **endptr, int base,
 {
     char *ep;

+    assert((unsigned) base <= 36 && base != 1);
     if (!nptr) {
         if (endptr) {
             *endptr = nptr;
@@ -502,6 +507,7 @@ int qemu_strtoi64(const char *nptr, const char **endptr, int base,
 {
     char *ep;

+    assert((unsigned) base <= 36 && base != 1);
     if (!nptr) {
         if (endptr) {
             *endptr = nptr;
@@ -525,6 +531,7 @@ int qemu_strtou64(const char *nptr, const char **endptr, int base,
 {
     char *ep;

+    assert((unsigned) base <= 36 && base != 1);
     if (!nptr) {
         if (endptr) {
             *endptr = nptr;
@@ -657,6 +664,7 @@ int parse_uint(const char *s, unsigned long long *value, char **endptr,
     char *endp = (char *)s;
     unsigned long long val = 0;

+    assert((unsigned) base <= 36 && base != 1);
     if (!s) {
         r = -EINVAL;
         goto out;
-- 
2.17.2


