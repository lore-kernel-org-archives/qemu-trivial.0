Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVDMQ-0000tb-Gw
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 02:09:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YVDMN-0000qI-O0
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 02:09:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YVDMJ-0000CL-LD
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 02:09:43 -0400
Received: from e06smtp15.uk.ibm.com ([195.75.94.111]:37639)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YVDMJ-0000C3-Cg
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 02:09:39 -0400
Received: from /spool/local
	by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Tue, 10 Mar 2015 06:09:37 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp15.uk.ibm.com (192.168.101.145) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 10 Mar 2015 06:09:34 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0D3FF17D8042; 
	Tue, 10 Mar 2015 06:09:56 +0000 (GMT)
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t2A69YjD786894; Tue, 10 Mar 2015 06:09:34 GMT
Received: from d06av04.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t2A69YRY030513; Tue, 10 Mar 2015 00:09:34 -0600
Received: from oc7435384737.ibm.com (sig-9-84-102-61.evts.de.ibm.com
	[9.84.102.61])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t2A69W49030462; Tue, 10 Mar 2015 00:09:33 -0600
Date: Tue, 10 Mar 2015 07:09:30 +0100
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20150310070930.3afb0d20@oc7435384737.ibm.com>
In-Reply-To: <54FDF32C.5060305@redhat.com>
References: <1425922215-20819-1-git-send-email-thuth@linux.vnet.ibm.com>
	<1425922215-20819-6-git-send-email-thuth@linux.vnet.ibm.com>
	<54FDF32C.5060305@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.23; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15031006-0021-0000-0000-0000032AA0C3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.111
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 5/8] ioport: Remove unused functions
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
X-List-Received-Date: Tue, 10 Mar 2015 06:09:44 -0000

On Mon, 09 Mar 2015 20:23:24 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> 
> On 09/03/2015 18:30, Thomas Huth wrote:
> > The functions portio_list_destroy() and portio_list_del()
> > are not used anywhere, so let's remove them.
> > 
> > Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> 
> I think it's better to provide a complete API, mimicking memory_region_*
> as much as possible, so I'd rather keep these.

Ok, then let's keep then and drop this patch.

 Thomas


