Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YNet5-0004ls-4u
	for mharc-qemu-trivial@gnu.org; Tue, 17 Feb 2015 04:56:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60050)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YNet0-0004fv-Ce
	for qemu-trivial@nongnu.org; Tue, 17 Feb 2015 04:56:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YNesr-0003kU-0l
	for qemu-trivial@nongnu.org; Tue, 17 Feb 2015 04:56:10 -0500
Received: from e06smtp18.uk.ibm.com ([195.75.94.114]:39325)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YNesq-0003k7-Mk
	for qemu-trivial@nongnu.org; Tue, 17 Feb 2015 04:56:00 -0500
Received: from /spool/local
	by e06smtp18.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Tue, 17 Feb 2015 09:55:59 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
	by e06smtp18.uk.ibm.com (192.168.101.148) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 17 Feb 2015 09:55:56 -0000
Received: from d06av11.portsmouth.uk.ibm.com (d06av11.portsmouth.uk.ibm.com
	[9.149.37.252])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t1H9qdA243122708; Tue, 17 Feb 2015 09:52:39 GMT
Received: from d06av11.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av11.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t1H9qdGI029958; Tue, 17 Feb 2015 02:52:39 -0700
Received: from oc7435384737.ibm.com (dyn-9-152-224-69.boeblingen.de.ibm.com
	[9.152.224.69])
	by d06av11.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t1H9qc4H029938; Tue, 17 Feb 2015 02:52:39 -0700
Date: Tue, 17 Feb 2015 10:52:37 +0100
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20150217105237.11ccdafd@oc7435384737.ibm.com>
In-Reply-To: <87twyknchm.fsf@blackfin.pond.sub.org>
References: <1424122891-9390-1-git-send-email-thuth@linux.vnet.ibm.com>
	<1424122891-9390-4-git-send-email-thuth@linux.vnet.ibm.com>
	<87twyknchm.fsf@blackfin.pond.sub.org>
Organization: IBM
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.23; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
x-cbid: 15021709-0033-0000-0000-0000001E273F
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.114
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/4] util: Remove unused
	functions
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
X-List-Received-Date: Tue, 17 Feb 2015 09:56:13 -0000


 Hi,

On Tue, 17 Feb 2015 09:55:33 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Thomas Huth <thuth@linux.vnet.ibm.com> writes:
> 
> > Delete the unused functions qemu_opt_get_number_del(),
> > qemu_signalfd_available(), qemu_send_full() and qemu_recv_full().
> >
> > Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
> 
> qemu_opt_get_number_del() was added in commit 782730b along with
> qemu_opt_get_del(), qemu_opt_get_bool_del() and qemu_opt_get_size_del().
> It hasn't been used so far, but removing it makes the interface
> irregular.  I'd rather not.

Ok, then let's keep them.

> qemu_signalfd_available() is unused since commit 6d32717.  It's also the
> only user of CONFIG_SIGNALFD.  If we want to drop it, I recommend
> dropping CONFIG_SIGNALFD as well.

As far as I can see, CONFIG_SIGNALFD is still used in qemu_signalfd(),
so I think we've got to keep that.

 Thomas


