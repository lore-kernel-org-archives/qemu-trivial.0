Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rl0XK-0006p8-9y
	for mharc-qemu-trivial@gnu.org; Wed, 11 Jan 2012 10:56:26 -0500
Received: from eggs.gnu.org ([140.186.70.92]:42498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1Rl0XB-0006kv-9c
	for qemu-trivial@nongnu.org; Wed, 11 Jan 2012 10:56:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1Rl0X5-0007JU-9C
	for qemu-trivial@nongnu.org; Wed, 11 Jan 2012 10:56:17 -0500
Received: from e5.ny.us.ibm.com ([32.97.182.145]:47852)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1Rl0X5-0007JN-6Q
	for qemu-trivial@nongnu.org; Wed, 11 Jan 2012 10:56:11 -0500
Received: from /spool/local
	by e5.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Wed, 11 Jan 2012 10:56:06 -0500
Received: from d01relay02.pok.ibm.com (9.56.227.234)
	by e5.ny.us.ibm.com (192.168.1.105) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 11 Jan 2012 10:52:55 -0500
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	q0BFprcw247606; Wed, 11 Jan 2012 10:52:00 -0500
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	q0BFpqrs019217; Wed, 11 Jan 2012 10:51:52 -0500
Received: from [9.59.241.154] (d941e-10.watson.ibm.com [9.59.241.154])
	by d01av01.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	q0BFpqdA019182; Wed, 11 Jan 2012 10:51:52 -0500
Message-ID: <4F0DB018.5080302@linux.vnet.ibm.com>
Date: Wed, 11 Jan 2012 10:51:52 -0500
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110928 Fedora/3.1.15-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.15
MIME-Version: 1.0
To: qemu-trivial@nongnu.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
x-cbid: 12011115-5930-0000-0000-000004018B73
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 32.97.182.145
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] hmp: Fix freeing of PciInfoList
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
X-List-Received-Date: Wed, 11 Jan 2012 15:56:25 -0000

Remember the original PciInfoList in info_list and use
the info variable to traverse the list.

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>

---
  hmp.c |    8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)

Index: qemu-git.pt/hmp.c
===================================================================
--- qemu-git.pt.orig/hmp.c
+++ qemu-git.pt/hmp.c
@@ -486,17 +486,17 @@ static void hmp_info_pci_device(Monitor

  void hmp_info_pci(Monitor *mon)
  {
-    PciInfoList *info;
+    PciInfoList *info_list, info;
      Error *err = NULL;

-    info = qmp_query_pci(&err);
+    info_list = qmp_query_pci(&err);
      if (err) {
          monitor_printf(mon, "PCI devices not supported\n");
          error_free(err);
          return;
      }

-    for (; info; info = info->next) {
+    for (info = info_list; info; info = info->next) {
          PciDeviceInfoList *dev;

          for (dev = info->value->devices; dev; dev = dev->next) {
@@ -504,7 +504,7 @@ void hmp_info_pci(Monitor *mon)
          }
      }

-    qapi_free_PciInfoList(info);
+    qapi_free_PciInfoList(info_list);
  }

  void hmp_info_tpm(Monitor *mon)


