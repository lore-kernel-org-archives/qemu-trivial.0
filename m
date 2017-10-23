Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e6jt4-0006i0-Dn
	for mharc-qemu-trivial@gnu.org; Mon, 23 Oct 2017 17:03:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1e6jt1-0006gH-W1
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 17:03:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1e6jt1-0007F4-3u
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 17:03:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37777)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <rjones@redhat.com>)
	id 1e6jsw-0007Da-KV; Mon, 23 Oct 2017 17:03:46 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9425785A02;
	Mon, 23 Oct 2017 21:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9425785A02
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=rjones@redhat.com
Received: from localhost (ovpn-117-112.ams2.redhat.com [10.36.117.112])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1211E4146;
	Mon, 23 Oct 2017 21:03:43 +0000 (UTC)
Date: Mon, 23 Oct 2017 22:03:42 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	amarnath.valluri@intel.com, marcandre.lureau@gmail.com,
	stefanb@linux.vnet.ibm.com
Message-ID: <20171023210342.GD18719@redhat.com>
References: <20171019075031.25507-1-rjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171019075031.25507-1-rjones@redhat.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 23 Oct 2017 21:03:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tpm: Don't call tpm_cleanup
 unless CONFIG_TPM.
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
X-List-Received-Date: Mon, 23 Oct 2017 21:03:53 -0000


Since I posted this, there are more failures with --disable-tpm ...

  LINK    x86_64-softmmu/qemu-system-x86_64
../vl.o: In function `main':
/home/rjones/d/qemu/vl.c:4908: undefined reference to `tpm_cleanup'
../tpm.o: In function `qmp_query_tpm_types':
/home/rjones/d/qemu/tpm.c:230: undefined reference to `tpm_be_find_by_type'
../tpm.o: In function `qmp_query_tpm_types':
tpm.c:(.text+0x4a): undefined reference to `tpm_be_find_by_type'
tpm.c:(.text+0x7a): undefined reference to `tpm_be_find_by_type'
collect2: error: ld returned 1 exit status
make[1]: *** [Makefile:193: qemu-system-x86_64] Error 1

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v

