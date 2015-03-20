Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYrY3-0005vz-Kx
	for mharc-qemu-trivial@gnu.org; Fri, 20 Mar 2015 03:40:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YYrY0-0005va-EP
	for qemu-trivial@nongnu.org; Fri, 20 Mar 2015 03:40:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YYrXw-0004YQ-DE
	for qemu-trivial@nongnu.org; Fri, 20 Mar 2015 03:40:48 -0400
Received: from e06smtp10.uk.ibm.com ([195.75.94.106]:60038)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YYrXw-0004YB-2g
	for qemu-trivial@nongnu.org; Fri, 20 Mar 2015 03:40:44 -0400
Received: from /spool/local
	by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Fri, 20 Mar 2015 07:40:42 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 20 Mar 2015 07:40:39 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 6B9B317D8042; 
	Fri, 20 Mar 2015 07:41:04 +0000 (GMT)
Received: from d06av08.portsmouth.uk.ibm.com (d06av08.portsmouth.uk.ibm.com
	[9.149.37.249])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t2K7ecs910879380; Fri, 20 Mar 2015 07:40:38 GMT
Received: from d06av08.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av08.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t2K7ec8T012679; Fri, 20 Mar 2015 01:40:38 -0600
Received: from oc7435384737.ibm.com (dyn-9-152-224-100.boeblingen.de.ibm.com
	[9.152.224.100])
	by d06av08.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t2K7ecBE012672; Fri, 20 Mar 2015 01:40:38 -0600
Date: Fri, 20 Mar 2015 08:40:36 +0100
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20150320084036.2f8cda73@oc7435384737.ibm.com>
In-Reply-To: <20150318142021-mutt-send-email-mst@redhat.com>
References: <1426313974-25607-1-git-send-email-thuth@linux.vnet.ibm.com>
	<1426313974-25607-4-git-send-email-thuth@linux.vnet.ibm.com>
	<20150318142021-mutt-send-email-mst@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.23; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15032007-0041-0000-0000-000003A76B33
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.106
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2 3/7] pci: Remove unused function
	ich9_d2pbr_init()
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
X-List-Received-Date: Fri, 20 Mar 2015 07:40:49 -0000

On Wed, 18 Mar 2015 14:20:41 +0100
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Sat, Mar 14, 2015 at 07:19:30AM +0100, Thomas Huth wrote:
> > The function ich9_d2pbr_init() is completely unused and
> > thus can be deleted.
> > 
> > Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> 
> I assume all this will go in for 2.4 through the trivial tree?

The patch that removes unused functions from the migration code has
already been picked up in the migration tree ... so I also don't mind
whether you want to take this through the pci tree or not. Just if
the patches are not picked up through other trees, they should finally
go through trivial, I think.

 Thomas


