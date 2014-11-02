Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkpCV-0008Et-Vj
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 02:03:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46463)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XkpCN-00084Y-C4
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 02:03:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XkpCH-0005OT-1o
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 02:03:39 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:47812)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XkpC4-0005Kz-D3; Sun, 02 Nov 2014 02:03:20 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 577B440231;
	Sun,  2 Nov 2014 10:03:17 +0300 (MSK)
Message-ID: <5455D735.2030202@msgid.tls.msk.ru>
Date: Sun, 02 Nov 2014 10:03:17 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1413535838-11000-1-git-send-email-zhang.zhanghailiang@huawei.com>	<5440DB35.9020507@huawei.com>	<54484C88.3070305@huawei.com>	<544E12FB.6070904@huawei.com>	<20141027084659.13cbdf8a@redhat.com>
	<5451F52A.7050305@huawei.com>
In-Reply-To: <5451F52A.7050305@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, luonengjun@huawei.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, Gonglei <arei.gonglei@huawei.com>,
	pbonzini@redhat.com, imammedo@redhat.com,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v6] numa: make 'info numa'
 take into account hotplugged memory
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
X-List-Received-Date: Sun, 02 Nov 2014 07:03:46 -0000

30.10.2014 11:22, zhanghailiang wrote:
> Hi Michael,
>=20
> Can you help applying this patch to -trivial branch?
> It has been reviewed, and it mainly fix bug for hmp command of 'info nu=
ma'.
> Which i don't know if it should go qemu-stable, for this is not a block=
er.
>=20
> Maybe go trivial branch is a better choice.

And the original patch description is:

>>>>>> When do memory hotplug, if there is numa node, we should add
>>>>>> the memory size to the corresponding node memory size.
>>>>>>
>>>>>> For now, it mainly affects the result of hmp command "info numa".

What does the "for now" means in this context?  Is the patch
incpmplete somehow and we should expect more code in this
area/theme?

In the patch we have:

+void query_numa_node_mem(uint64_t *node_mem)
+{
+    int i;
+
+    if (nb_numa_nodes <=3D 0) {
+        return;
+    }
+
+    numa_stat_memory_devices(node_mem);
+    for (i =3D 0; i < nb_numa_nodes; i++) {
+        node_mem[i] +=3D numa_info[i].node_mem;
+    }
+}

Please note that while the node_mem is a pointer, it is used as
an array.  In C, pointers and arrays in this context is the same
thing, but I think it is better to make the fact that it is an
array explicit in the function prototype, to be like this:

+void query_numa_node_mem(uint64_t node_mem[])

(But I don't know how various tools like coverity et al will react
to this.  Gcc and any other C compiler should be fine).

The same stands for other function prototype.

I'm not sure this qualifies as -trivial really.  Yes the change
does not affect anything but the `info' command, and is rather
simple, but... I'm not sure.

Thanks.

/mjt


