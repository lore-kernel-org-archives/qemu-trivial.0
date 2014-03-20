Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQfAK-0002ir-0i
	for mharc-qemu-trivial@gnu.org; Thu, 20 Mar 2014 11:45:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WQfAC-0001wM-H5
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 11:45:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WQfA6-0000Q7-H0
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 11:45:48 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52567)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WQf9s-0000O6-UQ; Thu, 20 Mar 2014 11:45:29 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6240742D07;
	Thu, 20 Mar 2014 19:45:00 +0400 (MSK)
Message-ID: <532B0CFC.6070309@msgid.tls.msk.ru>
Date: Thu, 20 Mar 2014 19:45:00 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Mario Smarduch <m.smarduch@samsung.com>
References: <5329D2CA.6020909@samsung.com>
In-Reply-To: <5329D2CA.6020909@samsung.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel][PATCH] fix return check for
 KVM_GET_DIRTY_LOG ioctl
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
X-List-Received-Date: Thu, 20 Mar 2014 15:45:54 -0000

19.03.2014 21:24, Mario Smarduch wrote:
> 
> Fix return condition check from kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d) to
> handle internal failures or no support for memory slot dirty bitmap.
> Otherwise the ioctl succeeds and continues with migration.
> Addresses BUG# 1294227

Thanks, applied to -trivial.

[]
> -        if (kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d) == -1) {
> +        if (kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d) < 0) {

Actually I'd make all error checks like this.  Many checks compares
return value with -1 for some reason, while actually, any <0 value
should be treated as error in many many places...  At the same time,
comparison with 0 is cheaper than comparison with -1 ;)

/mjt

