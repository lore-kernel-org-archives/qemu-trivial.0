Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yd02B-0006Ec-D4
	for mharc-qemu-trivial@gnu.org; Tue, 31 Mar 2015 13:33:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1Yd029-0006BH-05
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 13:33:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1Yd028-00007T-5A
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 13:33:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35296)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1Yd023-00006B-4s; Tue, 31 Mar 2015 13:32:55 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2VHWqZs015722
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 31 Mar 2015 13:32:53 -0400
Received: from localhost (ovpn-113-153.phx2.redhat.com [10.3.113.153])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2VHWpnB023912; Tue, 31 Mar 2015 13:32:52 -0400
Date: Tue, 31 Mar 2015 13:32:51 -0400
From: Luiz Capitulino <lcapitulino@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20150331133251.5be10dd6@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, eblake@redhat.com, armbru@redhat.com
Subject: [Qemu-trivial] [PATCH] balloon: improve error msg when adding
	second device
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
X-List-Received-Date: Tue, 31 Mar 2015 17:33:01 -0000

A VM supports only one balloon device, but due to several changes
in infrastructure the error message got messed up when trying
to add a second device. Fix it.

Before this fix

Command-line:

qemu-qmp: -device virtio-balloon-pci,id=balloon0: Another balloon device already registered
qemu-qmp: -device virtio-balloon-pci,id=balloon0: Adding balloon handler failed
qemu-qmp: -device virtio-balloon-pci,id=balloon0: Device 'virtio-balloon-pci' could not be initialized

HMP:

Another balloon device already registered
Adding balloon handler failed
Device 'virtio-balloon-pci' could not be initialized

QMP:

{ "execute": "device_add", "arguments": { "driver": "virtio-balloon-pci", "id": "balloon0" } }
{
	"error": {
		"class": "GenericError",
		"desc": "Adding balloon handler failed"
	}
}

After this fix

Command-line:

qemu-qmp: -device virtio-balloon-pci,id=balloon0: Only one balloon device is supported
qemu-qmp: -device virtio-balloon-pci,id=balloon0: Device 'virtio-balloon-pci' could not be initialized

HMP:

(qemu) device_add virtio-balloon-pci,id=balloon0
Only one balloon device is supported
Device 'virtio-balloon-pci' could not be initialized
(qemu)

QMP:

{ "execute": "device_add",
          "arguments": { "driver": "virtio-balloon-pci", "id": "balloon0" } }
{
    "error": {
        "class": "GenericError",
        "desc": "Only one balloon device is supported"
    }
}

Signed-off-by: Luiz Capitulino <lcapitulino@redhat.com>
---

I think this can go through in via -trivial. I also think this
is so simple and useful that it could be merged during freeze.

 balloon.c                  | 1 -
 hw/virtio/virtio-balloon.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/balloon.c b/balloon.c
index 70c00f5..c7033e3 100644
--- a/balloon.c
+++ b/balloon.c
@@ -58,7 +58,6 @@ int qemu_add_balloon_handler(QEMUBalloonEvent *event_func,
         /* We're already registered one balloon handler.  How many can
          * a guest really have?
          */
-        error_report("Another balloon device already registered");
         return -1;
     }
     balloon_event_fn = event_func;
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 95b0643..484c3c3 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -383,7 +383,7 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
                                    virtio_balloon_stat, s);
 
     if (ret < 0) {
-        error_setg(errp, "Adding balloon handler failed");
+        error_setg(errp, "Only one balloon device is supported");
         virtio_cleanup(vdev);
         return;
     }
-- 
1.9.3


