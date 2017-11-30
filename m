Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eKQHI-0003rm-Kz
	for mharc-qemu-trivial@gnu.org; Thu, 30 Nov 2017 09:57:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60920)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1eKQHD-0003nW-KD
	for qemu-trivial@nongnu.org; Thu, 30 Nov 2017 09:57:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1eKQHC-0003i6-OW
	for qemu-trivial@nongnu.org; Thu, 30 Nov 2017 09:57:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49614)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1eKQGf-0003X3-2O; Thu, 30 Nov 2017 09:56:49 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0AB954E4C2;
	Thu, 30 Nov 2017 14:56:48 +0000 (UTC)
Received: from work-vm (ovpn-117-222.ams2.redhat.com [10.36.117.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3C2360BE1;
	Thu, 30 Nov 2017 14:56:33 +0000 (UTC)
Date: Thu, 30 Nov 2017 14:56:30 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
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
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>, Richard Henderson <rth@twiddle.net>,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	"open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
	"open list:New World" <qemu-ppc@nongnu.org>,
	"open list:S390" <qemu-s390x@nongnu.org>
Message-ID: <20171130145630.GD3952@work-vm>
References: <20171130134159.9697-1-eblake@redhat.com>
	<20171130134159.9697-4-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171130134159.9697-4-eblake@redhat.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 30 Nov 2017 14:56:48 +0000 (UTC)
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
X-List-Received-Date: Thu, 30 Nov 2017 14:57:27 -0000

* Eric Blake (eblake@redhat.com) wrote:
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
> 
> Many of the places touched in this code are examples of the ugly
> bit-rotting debug print statements; cleaning those up is left as
> a bite-sized task for another day.
> 
> Found mechanically via: $ git grep -B1 'while (0);' | grep -A1 \\\\
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---

> diff --git a/migration/rdma.c b/migration/rdma.c
> index ca56594328..9d5a424011 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -88,7 +88,7 @@ static uint32_t known_capabilities = RDMA_CAPABILITY_PIN_ALL;
>              } \
>              return rdma->error_state; \
>          } \
> -    } while (0);
> +    } while (0)

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

