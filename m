Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aeUwB-0001gt-PJ
	for mharc-qemu-trivial@gnu.org; Fri, 11 Mar 2016 16:49:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <siddharthgupta04@gmail.com>) id 1aeOvo-0003Wo-26
	for qemu-trivial@nongnu.org; Fri, 11 Mar 2016 10:24:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <siddharthgupta04@gmail.com>) id 1aeOvm-0005H6-LJ
	for qemu-trivial@nongnu.org; Fri, 11 Mar 2016 10:24:47 -0500
Received: from mail-yw0-x233.google.com ([2607:f8b0:4002:c05::233]:36446)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <siddharthgupta04@gmail.com>)
	id 1aeOvm-0005H1-Dg; Fri, 11 Mar 2016 10:24:46 -0500
Received: by mail-yw0-x233.google.com with SMTP id g3so96377176ywa.3;
	Fri, 11 Mar 2016 07:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc;
	bh=J4sAgCrjXkJc67Ri0TZyJDoI7hhyCwzxST5UdZtbJAU=;
	b=wkFV3bvI3ev7SuhNG5JDDiUsW4jOSxIuQBqSn74ARWtlhr85lLGnpRfijc6SJOCYhg
	jI6fEUMS2Z0i2a9XNjEFFfIo2uWWP8md7+6buvxK9q7mfkWkhOpsMGztqveLqWGQBlKD
	6bwiS7YQQFrwsm6Lc7+p7AYOCQOOngRvuznjsAWykgAgz461Eux0b5eg14sYlovCZZCc
	nHcIG8q14/GA09Jij7GkLw/RZxZyOK6wFmz/tbGAmQHkTqSv1Butmr13DHLIeb7fQsJD
	cIMeQ+WwLCPJw4/dSLiQJxa40qO42+9X57Qd3DUqXtHOnwnj5Spt8vXcWsW6xw2h64b6
	A+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to:cc;
	bh=J4sAgCrjXkJc67Ri0TZyJDoI7hhyCwzxST5UdZtbJAU=;
	b=H4sUwqmUrmiND3fZZSIUw/Hfq7TXQOOqqUkaHplpv2yvptGUbPjYOVhbKIy8doYKrQ
	6j1RasBKO/qDehW4xEtMD1Er2qA1mQB+RouL+TLfbLwOIq35WWihzEJIIM9Q+SJhJ2Wj
	hZ0twYJ5l9ZRfe8NQQA8wEaUBTabkURvk7YiQMTYUJKIBNdw1khdEvRPMCosUOV05jN3
	brMb7yCcyE02ovbRL9aXtNOOuFZcOnHLLQ3iDak3CO2p6wIZiNTnkJpiUYTaB555+YzT
	1dNFYVaHqGjp/ApNoDYBBdybD5U0x4W58Aw9AgiVocuRsoOPKxTqziRhyGp6a2dAetJf
	BN3A==
X-Gm-Message-State: AD7BkJL1aMOrJa7AveEa5ZJ8apT0p2N28DuCX5/A2SLrj3D2QfnlvZsih0FS7kF1nx0bg3ZQ5Z48Wkvlh7zKsQ==
MIME-Version: 1.0
X-Received: by 10.13.255.4 with SMTP id p4mr5307284ywf.54.1457709885975; Fri,
	11 Mar 2016 07:24:45 -0800 (PST)
Received: by 10.37.210.201 with HTTP; Fri, 11 Mar 2016 07:24:45 -0800 (PST)
Date: Fri, 11 Mar 2016 20:54:45 +0530
Message-ID: <CALwKnOiWKiXMVwvvZj9pFdJnJ6Q5Z_Ar=Q7rEEp6AC6_vKs3Ww@mail.gmail.com>
From: Siddharth Gupta <siddharthgupta04@gmail.com>
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary=94eb2c0874e6f07404052dc787ee
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::233
X-Mailman-Approved-At: Fri, 11 Mar 2016 16:49:34 -0500
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] BiteSizedPatch-LargeFrames
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
X-List-Received-Date: Fri, 11 Mar 2016 15:24:49 -0000

--94eb2c0874e6f07404052dc787ee
Content-Type: text/plain; charset=UTF-8

From 032be62f56a207833ae12cc9474e3e8be5ed8eb4 Mon Sep 17 00:00:00 2001
From: Siddharth Gupta <siddharthgupta04@gmail.com>
Date: Fri, 11 Mar 2016 20:10:41 +0530
Subject: [PATCH] bitesizedtasks-large_frames-hw_dma_xilinx-hw_net_virtio

---
 hw/dma/xilinx_axidma.c |  5 ++++-
 hw/net/virtio-net.c    | 11 ++++++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index ce5c1e6..9c6bda2 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -255,13 +255,15 @@ static void stream_process_mem2s(struct Stream *s,
StreamSlave *tx_data_dev,
                                  StreamSlave *tx_control_dev)
 {
     uint32_t prev_d;
-    unsigned char txbuf[16 * 1024];
+    unsigned char *txbuf;
     unsigned int txlen;

     if (!stream_running(s) || stream_idle(s)) {
         return;
     }

+    txbuf = (unsigned char *) malloc(16 * 1024 * sizeof(unsigned char));
+
     while (1) {
         stream_desc_load(s, s->regs[R_CURDESC]);

@@ -303,6 +305,7 @@ static void stream_process_mem2s(struct Stream *s,
StreamSlave *tx_data_dev,
             break;
         }
     }
+    free(txbuf);
 }

 static size_t stream_process_s2mem(struct Stream *s, unsigned char *buf,
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 5798f87..ba6ebac 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1094,7 +1094,7 @@ static ssize_t virtio_net_receive(NetClientState *nc,
const uint8_t *buf, size_t
     VirtIONet *n = qemu_get_nic_opaque(nc);
     VirtIONetQueue *q = virtio_net_get_subqueue(nc);
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
-    struct iovec mhdr_sg[VIRTQUEUE_MAX_SIZE];
+    struct iovec *mhdr_sg;
     struct virtio_net_hdr_mrg_rxbuf mhdr;
     unsigned mhdr_cnt = 0;
     size_t offset, i, guest_offset;
@@ -1113,6 +1113,8 @@ static ssize_t virtio_net_receive(NetClientState *nc,
const uint8_t *buf, size_t

     offset = i = 0;

+    mhdr_sg = (struct iovec *) malloc(VIRTQUEUE_MAX_SIZE * sizeof(struct
iovec));
+
     while (offset < size) {
         VirtQueueElement *elem;
         int len, total;
@@ -1122,6 +1124,7 @@ static ssize_t virtio_net_receive(NetClientState *nc,
const uint8_t *buf, size_t

         elem = virtqueue_pop(q->rx_vq, sizeof(VirtQueueElement));
         if (!elem) {
+            free(mhdr_sg);
             if (i == 0)
                 return -1;
             error_report("virtio-net unexpected empty queue: "
@@ -1136,11 +1139,15 @@ static ssize_t virtio_net_receive(NetClientState
*nc, const uint8_t *buf, size_t

         if (elem->in_num < 1) {
             error_report("virtio-net receive queue contains no in
buffers");
+            free(mhdr_sg);
             exit(1);
         }

         sg = elem->in_sg;
         if (i == 0) {
+            if (offset != 0) {
+                free(mhdr_sg);
+            }
             assert(offset == 0);
             if (n->mergeable_rx_bufs) {
                 mhdr_cnt = iov_copy(mhdr_sg, ARRAY_SIZE(mhdr_sg),
@@ -1168,6 +1175,7 @@ static ssize_t virtio_net_receive(NetClientState *nc,
const uint8_t *buf, size_t
         if (!n->mergeable_rx_bufs && offset < size) {
             virtqueue_discard(q->rx_vq, elem, total);
             g_free(elem);
+            free(mhdr_sg);
             return size;
         }

@@ -1186,6 +1194,7 @@ static ssize_t virtio_net_receive(NetClientState *nc,
const uint8_t *buf, size_t
     virtqueue_flush(q->rx_vq, i);
     virtio_notify(vdev, q->rx_vq);

+    free(mhdr_sg);
     return size;
 }

-- 
2.5.0

Signed-off-by: Siddharth Gupta <siddharthgupta04@gmail.com>

--94eb2c0874e6f07404052dc787ee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+RnJvbSAwMzJiZTYyZjU2YTIwNzgzM2FlMTJjYzk0NzRlM2U4YmU1ZWQ4
ZWI0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMTxicj5Gcm9tOiBTaWRkaGFydGggR3VwdGEgJmx0
OzxhIGhyZWY9Im1haWx0bzpzaWRkaGFydGhndXB0YTA0QGdtYWlsLmNvbSI+c2lkZGhhcnRoZ3Vw
dGEwNEBnbWFpbC5jb208L2E+Jmd0Ozxicj5EYXRlOiBGcmksIDExIE1hciAyMDE2IDIwOjEwOjQx
ICswNTMwPGJyPlN1YmplY3Q6IFtQQVRDSF0gYml0ZXNpemVkdGFza3MtbGFyZ2VfZnJhbWVzLWh3
X2RtYV94aWxpbngtaHdfbmV0X3ZpcnRpbzxicj48YnI+LS0tPGJyPsKgaHcvZG1hL3hpbGlueF9h
eGlkbWEuYyB8wqAgNSArKysrLTxicj7CoGh3L25ldC92aXJ0aW8tbmV0LmPCoMKgwqAgfCAxMSAr
KysrKysrKysrLTxicj7CoDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSk8YnI+PGJyPmRpZmYgLS1naXQgYS9ody9kbWEveGlsaW54X2F4aWRtYS5jIGIvaHcv
ZG1hL3hpbGlueF9heGlkbWEuYzxicj5pbmRleCBjZTVjMWU2Li45YzZiZGEyIDEwMDY0NDxicj4t
LS0gYS9ody9kbWEveGlsaW54X2F4aWRtYS5jPGJyPisrKyBiL2h3L2RtYS94aWxpbnhfYXhpZG1h
LmM8YnI+QEAgLTI1NSwxMyArMjU1LDE1IEBAIHN0YXRpYyB2b2lkIHN0cmVhbV9wcm9jZXNzX21l
bTJzKHN0cnVjdCBTdHJlYW0gKnMsIFN0cmVhbVNsYXZlICp0eF9kYXRhX2Rldiw8YnI+wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFN0cmVhbVNsYXZlICp0eF9jb250cm9sX2Rldik8YnI+wqB7PGJyPsKgwqDCoMKgIHVpbnQz
Ml90IHByZXZfZDs8YnI+LcKgwqDCoCB1bnNpZ25lZCBjaGFyIHR4YnVmWzE2ICogMTAyNF07PGJy
PivCoMKgwqAgdW5zaWduZWQgY2hhciAqdHhidWY7PGJyPsKgwqDCoMKgIHVuc2lnbmVkIGludCB0
eGxlbjs8YnI+wqA8YnI+wqDCoMKgwqAgaWYgKCFzdHJlYW1fcnVubmluZyhzKSB8fCBzdHJlYW1f
aWRsZShzKSkgezxicj7CoMKgwqDCoMKgwqDCoMKgIHJldHVybjs8YnI+wqDCoMKgwqAgfTxicj7C
oDxicj4rwqDCoMKgIHR4YnVmID0gKHVuc2lnbmVkIGNoYXIgKikgbWFsbG9jKDE2ICogMTAyNCAq
IHNpemVvZih1bnNpZ25lZCBjaGFyKSk7PGJyPis8YnI+wqDCoMKgwqAgd2hpbGUgKDEpIHs8YnI+
wqDCoMKgwqDCoMKgwqDCoCBzdHJlYW1fZGVzY19sb2FkKHMsIHMtJmd0O3JlZ3NbUl9DVVJERVND
XSk7PGJyPsKgPGJyPkBAIC0zMDMsNiArMzA1LDcgQEAgc3RhdGljIHZvaWQgc3RyZWFtX3Byb2Nl
c3NfbWVtMnMoc3RydWN0IFN0cmVhbSAqcywgU3RyZWFtU2xhdmUgKnR4X2RhdGFfZGV2LDxicj7C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7PGJyPsKgwqDCoMKgwqDCoMKgwqAgfTxicj7C
oMKgwqDCoCB9PGJyPivCoMKgwqAgZnJlZSh0eGJ1Zik7PGJyPsKgfTxicj7CoDxicj7CoHN0YXRp
YyBzaXplX3Qgc3RyZWFtX3Byb2Nlc3NfczJtZW0oc3RydWN0IFN0cmVhbSAqcywgdW5zaWduZWQg
Y2hhciAqYnVmLDxicj5kaWZmIC0tZ2l0IGEvaHcvbmV0L3ZpcnRpby1uZXQuYyBiL2h3L25ldC92
aXJ0aW8tbmV0LmM8YnI+aW5kZXggNTc5OGY4Ny4uYmE2ZWJhYyAxMDA2NDQ8YnI+LS0tIGEvaHcv
bmV0L3ZpcnRpby1uZXQuYzxicj4rKysgYi9ody9uZXQvdmlydGlvLW5ldC5jPGJyPkBAIC0xMDk0
LDcgKzEwOTQsNyBAQCBzdGF0aWMgc3NpemVfdCB2aXJ0aW9fbmV0X3JlY2VpdmUoTmV0Q2xpZW50
U3RhdGUgKm5jLCBjb25zdCB1aW50OF90ICpidWYsIHNpemVfdDxicj7CoMKgwqDCoCBWaXJ0SU9O
ZXQgKm4gPSBxZW11X2dldF9uaWNfb3BhcXVlKG5jKTs8YnI+wqDCoMKgwqAgVmlydElPTmV0UXVl
dWUgKnEgPSB2aXJ0aW9fbmV0X2dldF9zdWJxdWV1ZShuYyk7PGJyPsKgwqDCoMKgIFZpcnRJT0Rl
dmljZSAqdmRldiA9IFZJUlRJT19ERVZJQ0Uobik7PGJyPi3CoMKgwqAgc3RydWN0IGlvdmVjIG1o
ZHJfc2dbVklSVFFVRVVFX01BWF9TSVpFXTs8YnI+K8KgwqDCoCBzdHJ1Y3QgaW92ZWMgKm1oZHJf
c2c7PGJyPsKgwqDCoMKgIHN0cnVjdCB2aXJ0aW9fbmV0X2hkcl9tcmdfcnhidWYgbWhkcjs8YnI+
wqDCoMKgwqAgdW5zaWduZWQgbWhkcl9jbnQgPSAwOzxicj7CoMKgwqDCoCBzaXplX3Qgb2Zmc2V0
LCBpLCBndWVzdF9vZmZzZXQ7PGJyPkBAIC0xMTEzLDYgKzExMTMsOCBAQCBzdGF0aWMgc3NpemVf
dCB2aXJ0aW9fbmV0X3JlY2VpdmUoTmV0Q2xpZW50U3RhdGUgKm5jLCBjb25zdCB1aW50OF90ICpi
dWYsIHNpemVfdDxicj7CoDxicj7CoMKgwqDCoCBvZmZzZXQgPSBpID0gMDs8YnI+wqA8YnI+K8Kg
wqDCoCBtaGRyX3NnID0gKHN0cnVjdCBpb3ZlYyAqKSBtYWxsb2MoVklSVFFVRVVFX01BWF9TSVpF
ICogc2l6ZW9mKHN0cnVjdCBpb3ZlYykpOzxicj4rPGJyPsKgwqDCoMKgIHdoaWxlIChvZmZzZXQg
Jmx0OyBzaXplKSB7PGJyPsKgwqDCoMKgwqDCoMKgwqAgVmlydFF1ZXVlRWxlbWVudCAqZWxlbTs8
YnI+wqDCoMKgwqDCoMKgwqDCoCBpbnQgbGVuLCB0b3RhbDs8YnI+QEAgLTExMjIsNiArMTEyNCw3
IEBAIHN0YXRpYyBzc2l6ZV90IHZpcnRpb19uZXRfcmVjZWl2ZShOZXRDbGllbnRTdGF0ZSAqbmMs
IGNvbnN0IHVpbnQ4X3QgKmJ1Ziwgc2l6ZV90PGJyPsKgPGJyPsKgwqDCoMKgwqDCoMKgwqAgZWxl
bSA9IHZpcnRxdWV1ZV9wb3AocS0mZ3Q7cnhfdnEsIHNpemVvZihWaXJ0UXVldWVFbGVtZW50KSk7
PGJyPsKgwqDCoMKgwqDCoMKgwqAgaWYgKCFlbGVtKSB7PGJyPivCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGZyZWUobWhkcl9zZyk7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoaSA9PSAw
KTxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLTE7PGJyPsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBlcnJvcl9yZXBvcnQoJnF1b3Q7dmlydGlvLW5ldCB1bmV4cGVj
dGVkIGVtcHR5IHF1ZXVlOiAmcXVvdDs8YnI+QEAgLTExMzYsMTEgKzExMzksMTUgQEAgc3RhdGlj
IHNzaXplX3QgdmlydGlvX25ldF9yZWNlaXZlKE5ldENsaWVudFN0YXRlICpuYywgY29uc3QgdWlu
dDhfdCAqYnVmLCBzaXplX3Q8YnI+wqA8YnI+wqDCoMKgwqDCoMKgwqDCoCBpZiAoZWxlbS0mZ3Q7
aW5fbnVtICZsdDsgMSkgezxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXJyb3JfcmVwb3J0
KCZxdW90O3ZpcnRpby1uZXQgcmVjZWl2ZSBxdWV1ZSBjb250YWlucyBubyBpbiBidWZmZXJzJnF1
b3Q7KTs8YnI+K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJlZShtaGRyX3NnKTs8YnI+wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGV4aXQoMSk7PGJyPsKgwqDCoMKgwqDCoMKgwqAgfTxicj7CoDxi
cj7CoMKgwqDCoMKgwqDCoMKgIHNnID0gZWxlbS0mZ3Q7aW5fc2c7PGJyPsKgwqDCoMKgwqDCoMKg
wqAgaWYgKGkgPT0gMCkgezxicj4rwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAob2Zmc2V0ICE9
IDApIHs8YnI+K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcmVlKG1oZHJfc2cpOzxi
cj4rwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBh
c3NlcnQob2Zmc2V0ID09IDApOzxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKG4tJmd0
O21lcmdlYWJsZV9yeF9idWZzKSB7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG1oZHJfY250ID0gaW92X2NvcHkobWhkcl9zZywgQVJSQVlfU0laRShtaGRyX3NnKSw8YnI+QEAg
LTExNjgsNiArMTE3NSw3IEBAIHN0YXRpYyBzc2l6ZV90IHZpcnRpb19uZXRfcmVjZWl2ZShOZXRD
bGllbnRTdGF0ZSAqbmMsIGNvbnN0IHVpbnQ4X3QgKmJ1Ziwgc2l6ZV90PGJyPsKgwqDCoMKgwqDC
oMKgwqAgaWYgKCFuLSZndDttZXJnZWFibGVfcnhfYnVmcyAmYW1wOyZhbXA7IG9mZnNldCAmbHQ7
IHNpemUpIHs8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZpcnRxdWV1ZV9kaXNjYXJkKHEt
Jmd0O3J4X3ZxLCBlbGVtLCB0b3RhbCk7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnX2Zy
ZWUoZWxlbSk7PGJyPivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyZWUobWhkcl9zZyk7PGJyPsKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gc2l6ZTs8YnI+wqDCoMKgwqDCoMKgwqDCoCB9
PGJyPsKgPGJyPkBAIC0xMTg2LDYgKzExOTQsNyBAQCBzdGF0aWMgc3NpemVfdCB2aXJ0aW9fbmV0
X3JlY2VpdmUoTmV0Q2xpZW50U3RhdGUgKm5jLCBjb25zdCB1aW50OF90ICpidWYsIHNpemVfdDxi
cj7CoMKgwqDCoCB2aXJ0cXVldWVfZmx1c2gocS0mZ3Q7cnhfdnEsIGkpOzxicj7CoMKgwqDCoCB2
aXJ0aW9fbm90aWZ5KHZkZXYsIHEtJmd0O3J4X3ZxKTs8YnI+wqA8YnI+K8KgwqDCoCBmcmVlKG1o
ZHJfc2cpOzxicj7CoMKgwqDCoCByZXR1cm4gc2l6ZTs8YnI+wqB9PGJyPsKgPGJyPi0tIDxicj4y
LjUuMDxicj48YnI+U2lnbmVkLW9mZi1ieTogU2lkZGhhcnRoIEd1cHRhICZsdDs8YSBocmVmPSJt
YWlsdG86c2lkZGhhcnRoZ3VwdGEwNEBnbWFpbC5jb20iPnNpZGRoYXJ0aGd1cHRhMDRAZ21haWwu
Y29tPC9hPiZndDs8L2Rpdj4NCg==
--94eb2c0874e6f07404052dc787ee--

