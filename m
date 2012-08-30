Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T7AHg-0001wr-2h
	for mharc-qemu-trivial@gnu.org; Thu, 30 Aug 2012 15:20:08 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1T7AHc-0001oA-D9
	for qemu-trivial@nongnu.org; Thu, 30 Aug 2012 15:20:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1T7AHa-0006vG-Pd
	for qemu-trivial@nongnu.org; Thu, 30 Aug 2012 15:20:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:23498)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1T7AHX-0006rN-QP; Thu, 30 Aug 2012 15:20:00 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7UJJv3R001865
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 30 Aug 2012 15:19:57 -0400
Received: from doriath.home (ovpn-113-91.phx2.redhat.com [10.3.113.91])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q7UJJtZ1009245; Thu, 30 Aug 2012 15:19:55 -0400
Date: Thu, 30 Aug 2012 16:20:43 -0300
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Lei Li <lilei@linux.vnet.ibm.com>
Message-ID: <20120830162043.140f8bcc@doriath.home>
In-Reply-To: <1345698866-19794-6-git-send-email-lilei@linux.vnet.ibm.com>
References: <1345698866-19794-1-git-send-email-lilei@linux.vnet.ibm.com>
	<1345698866-19794-6-git-send-email-lilei@linux.vnet.ibm.com>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, eblake@redhat.com,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 5/6] Fix enumeration typo
	error
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
X-List-Received-Date: Thu, 30 Aug 2012 19:20:06 -0000

On Thu, 23 Aug 2012 13:14:25 +0800
Lei Li <lilei@linux.vnet.ibm.com> wrote:

> Signed-off-by: Lei Li <lilei@linux.vnet.ibm.com>

Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>

PS: CC'ing qemu-trivial as per Eric's suggestion.

> ---
>  qapi-schema-guest.json |    2 +-
>  qapi-schema.json       |    4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/qapi-schema-guest.json b/qapi-schema-guest.json
> index d955cf1..ed0eb69 100644
> --- a/qapi-schema-guest.json
> +++ b/qapi-schema-guest.json
> @@ -293,7 +293,7 @@
>  ##
>  # @GuestFsFreezeStatus
>  #
> -# An enumation of filesystem freeze states
> +# An enumeration of filesystem freeze states
>  #
>  # @thawed: filesystems thawed/unfrozen
>  #
> diff --git a/qapi-schema.json b/qapi-schema.json
> index 1346bcc..8e13a05 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -118,7 +118,7 @@
>  ##
>  # @RunState
>  #
> -# An enumation of VM run states.
> +# An enumeration of VM run states.
>  #
>  # @debug: QEMU is running on a debugger
>  #
> @@ -836,7 +836,7 @@
>  ##
>  # @SpiceQueryMouseMode
>  #
> -# An enumation of Spice mouse states.
> +# An enumeration of Spice mouse states.
>  #
>  # @client: Mouse cursor position is determined by the client.
>  #


