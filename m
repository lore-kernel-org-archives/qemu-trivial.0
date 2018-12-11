Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmPS-00008W-Av
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:05:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPM-0008PR-C0
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPH-0007dg-JP
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:24 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:35345)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmP9-0007SB-NE; Tue, 11 Dec 2018 13:05:12 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MYcy3-1h0dTY2wlv-00VeXe; Tue, 11 Dec 2018 19:04:23 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Date: Tue, 11 Dec 2018 19:03:49 +0100
Message-Id: <20181211180352.19644-28-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0Z6qO3AZfhV6zy0R0ESnYh+4GwNUhMryFhBck4D2JsF6VkbTSsp
	vkd+io9Wa7hhgEgk7612C+429ZxNbv6NqGkMWN15yZfuVPttz7ZXyN6T54JD3f3bxpDnqsp
	v4mTUd67Av8KR6QoFMg2/F8uK829lF/wQj/bNKEaRlnV+O2xaMeEZqYG6L+J9j1r3eRq727
	PAFSLOnswtS2MBOhYhobw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:H+dBeiRZ1Xw=:okXRxshUqM4b4+Nw16w+qP
	mWWTVzO2MxN99HRfzNzJoE3WP8nx+dVZRrhzYPT0ibZ1QsdF1fuZ9G3GlRXcpHZRfW1TpvLuj
	pYW6eWlp89elkhVK5W8ldOeP7qd3DNnF8kQ2Hn3J9lK4IHv94qrYKYakuiSTqTflMI5FS7OGF
	it7UvCtR4IJcQRmZIGjwX2zkKI6Ax0DFKQIxulsFPYqmdjwFfsIlSWbNCwNEJ4m++K8FhOoeC
	mM4EYJezIRZjlnC9tKay8CA4DmiIRXhPuud6F33aoe6wdwCj2Ic70nJGO9bL6u+JNqU0MdpCt
	BtDibK/y/moarjS8CZAmCu0gXIKa7hfrH8DbTz4k4Bj5SRpPo5uE0y6kOFsmkQUdX6tKpOgCQ
	dhGh2RV+OSfGQdoC+HFZU63zSpl6w0DD+7Tj0Rp28z476DRJ0g6zFukjuOl7UeYlecfFuCyfj
	IUY9mizd6aH7R8qf2T5lJTPOHWlwVbexBZY30hW+2MJvErdctft2BSbsk1QycKu+D6EHoKtaK
	XG2bDl6/Pgzi7hWtCp314IEzJVSj8TYs6YSXA4UM2e3DPM07juw5rdJdQtKRx1eoZED0infIM
	tys1mNHrOb6TgUbS23fNeBvZTBFctLgImwpEAswD2C4ZGpAJUsaB5A+oz8fR7ZFvjtLSPmFN1
	6TBxHPbA9wWuKRfU9lDFv4oBhBLAsuKtQnJFPHMIr21iK1ckszf1gqVu8PV2mtlVaCSHx77oC
	UtdhgV3DbowLJ0UclYalD/thCWksgpbZSLMzgyfOH4bfXDpyesoYZj7V3iY=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL 27/30] cutils: Assert in-range base for
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
X-List-Received-Date: Tue, 11 Dec 2018 18:05:28 -0000

From: Eric Blake <eblake@redhat.com>

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
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20181206151856.77503-1-eblake@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 util/cutils.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/util/cutils.c b/util/cutils.c
index 698bd315bd..0621565930 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -280,6 +280,7 @@ int qemu_strtosz_metric(const char *nptr, char **end, uint64_t *result)
 static int check_strtox_error(const char *nptr, char *ep,
                               const char **endptr, int libc_errno)
 {
+    assert(ep >= nptr);
     if (endptr) {
         *endptr = ep;
     }
@@ -327,6 +328,7 @@ int qemu_strtoi(const char *nptr, const char **endptr, int base,
     char *ep;
     long long lresult;
 
+    assert((unsigned) base <= 36 && base != 1);
     if (!nptr) {
         if (endptr) {
             *endptr = nptr;
@@ -379,6 +381,7 @@ int qemu_strtoui(const char *nptr, const char **endptr, int base,
     char *ep;
     long long lresult;
 
+    assert((unsigned) base <= 36 && base != 1);
     if (!nptr) {
         if (endptr) {
             *endptr = nptr;
@@ -435,6 +438,7 @@ int qemu_strtol(const char *nptr, const char **endptr, int base,
 {
     char *ep;
 
+    assert((unsigned) base <= 36 && base != 1);
     if (!nptr) {
         if (endptr) {
             *endptr = nptr;
@@ -477,6 +481,7 @@ int qemu_strtoul(const char *nptr, const char **endptr, int base,
 {
     char *ep;
 
+    assert((unsigned) base <= 36 && base != 1);
     if (!nptr) {
         if (endptr) {
             *endptr = nptr;
@@ -504,6 +509,7 @@ int qemu_strtoi64(const char *nptr, const char **endptr, int base,
 {
     char *ep;
 
+    assert((unsigned) base <= 36 && base != 1);
     if (!nptr) {
         if (endptr) {
             *endptr = nptr;
@@ -527,6 +533,7 @@ int qemu_strtou64(const char *nptr, const char **endptr, int base,
 {
     char *ep;
 
+    assert((unsigned) base <= 36 && base != 1);
     if (!nptr) {
         if (endptr) {
             *endptr = nptr;
@@ -594,6 +601,7 @@ int parse_uint(const char *s, unsigned long long *value, char **endptr,
     char *endp = (char *)s;
     unsigned long long val = 0;
 
+    assert((unsigned) base <= 36 && base != 1);
     if (!s) {
         r = -EINVAL;
         goto out;
-- 
2.19.2


