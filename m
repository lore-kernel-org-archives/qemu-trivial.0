Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QKSBz-0000Xu-Oc
	for mharc-qemu-trivial@gnu.org; Thu, 12 May 2011 05:28:23 -0400
Received: from eggs.gnu.org ([140.186.70.92]:46182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1QKSBx-0000SR-1Z
	for qemu-trivial@nongnu.org; Thu, 12 May 2011 05:28:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1QKSBv-0004u1-W2
	for qemu-trivial@nongnu.org; Thu, 12 May 2011 05:28:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52370)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1QKSBn-0004tF-RW; Thu, 12 May 2011 05:28:12 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p4C9S8HP004964
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 12 May 2011 05:28:08 -0400
Received: from rincewind.home.kraxel.org (vpn2-10-138.ams2.redhat.com
	[10.36.10.138])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p4C9S7Me014345; Thu, 12 May 2011 05:28:07 -0400
Message-ID: <4DCBA827.5010304@redhat.com>
Date: Thu, 12 May 2011 11:28:07 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110419 Red Hat/3.1.10-1.el6_0
	Thunderbird/3.1.10
MIME-Version: 1.0
To: Jan Vesely <jano.vesely@gmail.com>
References: <BANLkTik3hmvH6_tUuEZjR8j0L04PdCk7mw@mail.gmail.com>	<4DC29287.5030106@redhat.com>	<BANLkTik=gr0K9-_fOTqPQORo37xs2D+9Yg@mail.gmail.com>	<4DC79DEC.50401@redhat.com>	<BANLkTimMGis4pBnZvbP=KwKtaOp8rDCfBQ@mail.gmail.com>	<4DC7D353.6020607@redhat.com>
	<BANLkTi=PJMUjFCF--N9F60GhT-04jAeFcg@mail.gmail.com>
In-Reply-To: <BANLkTi=PJMUjFCF--N9F60GhT-04jAeFcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] Bug #757654: UHCI fails to signal
 stall response patch
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
X-List-Received-Date: Thu, 12 May 2011 09:28:22 -0000

On 05/11/11 13:33, Jan Vesely wrote:
> glad I could help
>
> the original bug report is here: https://bugs.launchpad.net/qemu/+bug/757654
> should I update it? or will it be updated when the patch reaches master?

Better wait until the stuff hits master, that is less confusing and you 
can also add the git commit hash then.

cheers,
   Gerd


