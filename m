Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eKQ4J-0003P5-88
	for mharc-qemu-trivial@gnu.org; Thu, 30 Nov 2017 09:44:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56876)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eKQ48-0003Iu-5F
	for qemu-trivial@nongnu.org; Thu, 30 Nov 2017 09:43:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eKQ44-0003ZL-8b
	for qemu-trivial@nongnu.org; Thu, 30 Nov 2017 09:43:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36508)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1eKQ3V-0003O4-2j; Thu, 30 Nov 2017 09:43:13 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8AD0E356F7;
	Thu, 30 Nov 2017 14:43:11 +0000 (UTC)
Received: from redhat.com (ovpn-122-157.rdu2.redhat.com [10.10.122.157])
	by smtp.corp.redhat.com (Postfix) with SMTP id F311A5C1A3;
	Thu, 30 Nov 2017 14:43:03 +0000 (UTC)
Date: Thu, 30 Nov 2017 16:43:03 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alexander Graf <agraf@suse.de>, Jason Wang <jasowang@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Igor Mammedov <imammedo@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	"open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
	"open list:New World" <qemu-ppc@nongnu.org>,
	"open list:S390" <qemu-s390x@nongnu.org>
Message-ID: <20171130163902-mutt-send-email-mst@kernel.org>
References: <20171130134159.9697-1-eblake@redhat.com>
	<20171130134159.9697-4-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171130134159.9697-4-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 30 Nov 2017 14:43:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 3/3] maint: Fix macros with broken
 'do/while(0); ' usage
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
X-List-Received-Date: Thu, 30 Nov 2017 14:44:01 -0000

On Thu, Nov 30, 2017 at 07:41:59AM -0600, Eric Blake wrote:
> The point of writing a macro embedded in a 'do { ... } while (0)'
> loop is so that the macro can be used as a drop-in statement with
> the caller supplying the trailing ';'.  Although our coding style
> frowns on brace-less 'if':
>   if (cond)
>     statement;
>   else
>     something else;
> the use of do/while (0) in a macro is absolutely essential for the
> purpose of avoiding a syntax error on the 'else' - but it only works
> if there is no trailing ';' in the macro (as the ';' in the code
> calling the macro would then be a second statement and cause the
> 'else' to not pair to the 'if').

Shouldn't matter if everyone puts the statements in {}, right?

> Many of the places touched in this code are examples of the ugly
> bit-rotting debug print statements; cleaning those up is left as
> a bite-sized task for another day.
> 
> Found mechanically via: $ git grep -B1 'while (0);' | grep -A1 \\\\
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

We can't really rely on code still building for this to do the right
thing, can we?  I did my best to look for uses and I think it's OK, so

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

but I'm not merging this.

> -- 
> 2.14.3

