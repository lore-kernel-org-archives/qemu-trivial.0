Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SmyVC-0003ET-Gb
	for mharc-qemu-trivial@gnu.org; Thu, 05 Jul 2012 22:42:38 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1SmyVA-00037q-DE
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2012 22:42:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1SmyV8-0000NO-Md
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2012 22:42:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:22517)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>)
	id 1SmyV5-0000Mb-Fn; Thu, 05 Jul 2012 22:42:31 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q662gS9i016252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 5 Jul 2012 22:42:28 -0400
Received: from [10.66.7.109] ([10.66.7.109])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q662gPMD023366; Thu, 5 Jul 2012 22:42:26 -0400
Message-ID: <4FF65090.3040402@redhat.com>
Date: Fri, 06 Jul 2012 10:42:24 +0800
From: Amos Kong <akong@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: akong@redhat.com
References: <1341021237-11293-1-git-send-email-akong@redhat.com>
	<1341021740-11426-1-git-send-email-akong@redhat.com>
In-Reply-To: <1341021740-11426-1-git-send-email-akong@redhat.com>
Content-Type: multipart/mixed; boundary="------------000409000008050903050003"
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, pkrempa@redhat.com,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [Qemu-devel] [PATCH v2] vnc: add a more descriptive
	error message
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
X-List-Received-Date: Fri, 06 Jul 2012 02:42:38 -0000

This is a multi-part message in MIME format.
--------------000409000008050903050003
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 30/06/12 10:02, akong@redhat.com wrote:
> From: Amos Kong<akong@redhat.com>
>
> Currently qemu outputs some low-level error in qemu-sockets.c
> when failed to start vnc server.
> eg. 'getaddrinfo(127.0.0.1,5902): Name or service not known'
>
> Some libvirt users could not know what's happened with this
> unclear error message. This patch added a more descriptive
> error message.
>
> Signed-off-by: Amos Kong<akong@redhat.com>
>
> ---
> V2: improve the commitlog
> ---
>   vl.c |    5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>

CC: qemu-trivial@nongnu.org


--------------000409000008050903050003
Content-Type: text/plain;
 name="0001-vnc-add-a-more-descriptive-error-message.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-vnc-add-a-more-descriptive-error-message.patch"

From ae5d1000b1e30ab03d56f93a751b47e89f91ca41 Mon Sep 17 00:00:00 2001
From: Amos Kong <akong@redhat.com>
Date: Sat, 30 Jun 2012 10:02:20 +0800
Subject: [PATCH v2] vnc: add a more descriptive error message

Currently qemu outputs some low-level error in qemu-sockets.c
when failed to start vnc server.
eg. 'getaddrinfo(127.0.0.1,5902): Name or service not known'

Some libvirt users could not know what's happened with this
unclear error message. This patch added a more descriptive
error message.

Signed-off-by: Amos Kong <akong@redhat.com>
---
V2: improve the commitlog
---
 vl.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/vl.c b/vl.c
index 23ab3a3..cea97be 100644
--- a/vl.c
+++ b/vl.c
@@ -3583,8 +3583,11 @@ int main(int argc, char **argv, char **envp)
     /* init remote displays */
     if (vnc_display) {
         vnc_display_init(ds);
-        if (vnc_display_open(ds, vnc_display) < 0)
+        if (vnc_display_open(ds, vnc_display) < 0) {
+            fprintf(stderr, "Failed to start VNC server on `%s'\n",
+                    vnc_display);
             exit(1);
+        }
 
         if (show_vnc_port) {
             printf("VNC server running on `%s'\n", vnc_display_local_addr(ds));
-- 
1.7.7.3


--------------000409000008050903050003--

