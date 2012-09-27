Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1THDcf-0000fj-6L
	for mharc-qemu-trivial@gnu.org; Thu, 27 Sep 2012 08:55:21 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1THDcZ-0000Ng-BZ
	for qemu-trivial@nongnu.org; Thu, 27 Sep 2012 08:55:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1THDcP-0008SC-La
	for qemu-trivial@nongnu.org; Thu, 27 Sep 2012 08:55:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:23074)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1THDcM-0008Ir-N0; Thu, 27 Sep 2012 08:55:02 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q8RCt1DC006963
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 27 Sep 2012 08:55:01 -0400
Received: from doriath.home (ovpn-113-87.phx2.redhat.com [10.3.113.87])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q8RCsxSv025841; Thu, 27 Sep 2012 08:55:00 -0400
Date: Thu, 27 Sep 2012 09:55:53 -0300
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20120927095553.6e28766c@doriath.home>
In-Reply-To: <1348670069-4862-1-git-send-email-pbonzini@redhat.com>
References: <1348670069-4862-1-git-send-email-pbonzini@redhat.com>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block: live snapshot
	documentation tweaks
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
X-List-Received-Date: Thu, 27 Sep 2012 12:55:19 -0000

On Wed, 26 Sep 2012 16:34:29 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Applied to the qmp branch, thanks.

> ---
>  qapi-schema.json | 4 ++--
>  1 file modificato, 2 inserzioni(+), 2 rimozioni(-)
> 
> diff --git a/qapi-schema.json b/qapi-schema.json
> index 8719a9d..26ac21f 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -1402,7 +1402,7 @@
>  # @format: #optional the format of the snapshot image, default is 'qcow2'.
>  #
>  # @mode: #optional whether and how QEMU should create a new image, default is
> -# 'absolute-paths'.
> +#        'absolute-paths'.
>  ##
>  { 'type': 'BlockdevSnapshot',
>    'data': { 'device': 'str', 'snapshot-file': 'str', '*format': 'str',
> @@ -1456,7 +1456,7 @@
>  # @format: #optional the format of the snapshot image, default is 'qcow2'.
>  #
>  # @mode: #optional whether and how QEMU should create a new image, default is
> -# 'absolute-paths'.
> +#        'absolute-paths'.
>  #
>  # Returns: nothing on success
>  #          If @device is not a valid block device, DeviceNotFound


