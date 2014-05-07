Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wi3iG-0006Zb-T3
	for mharc-qemu-trivial@gnu.org; Wed, 07 May 2014 11:24:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1Wi3i9-0006ST-Ry
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 11:24:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1Wi3i3-00067m-NY
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 11:24:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:24719)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1Wi3hr-00065t-59; Wed, 07 May 2014 11:24:27 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s47FOPes022198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 7 May 2014 11:24:26 -0400
Received: from localhost (ovpn-113-48.phx2.redhat.com [10.3.113.48])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s47FOO76012838; Wed, 7 May 2014 11:24:24 -0400
Date: Wed, 7 May 2014 11:24:24 -0400
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Fam Zheng <famz@redhat.com>
Message-ID: <20140507112424.4727b05d@redhat.com>
In-Reply-To: <1399427861-26440-1-git-send-email-famz@redhat.com>
References: <1399427861-26440-1-git-send-email-famz@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
	Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v3] qapi: Document optional arguments'
 backwards compatibility
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
X-List-Received-Date: Wed, 07 May 2014 15:24:52 -0000

On Wed,  7 May 2014 09:57:41 +0800
Fam Zheng <famz@redhat.com> wrote:

> From: Eric Blake <eblake@redhat.com>
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Fam Zheng <famz@redhat.com>

Applied to the qmp branch, thanks.

> 
> ---
> v3: More text from Eric.
> 
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  docs/qapi-code-gen.txt | 32 ++++++++++++++++++++++++++++----
>  1 file changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/qapi-code-gen.txt b/docs/qapi-code-gen.txt
> index d78921f..a6cba0a 100644
> --- a/docs/qapi-code-gen.txt
> +++ b/docs/qapi-code-gen.txt
> @@ -49,10 +49,34 @@ example of a complex type is:
>   { 'type': 'MyType',
>     'data': { 'member1': 'str', 'member2': 'int', '*member3': 'str' } }
>  
> -The use of '*' as a prefix to the name means the member is optional.  Optional
> -members should always be added to the end of the dictionary to preserve
> -backwards compatibility.
> -
> +The use of '*' as a prefix to the name means the member is optional.
> +
> +The default initialization value of an optional argument should not be changed
> +between versions of QEMU unless the new default maintains backward
> +compatibility to the user-visible behavior of the old default.
> +
> +With proper documentation, this policy still allows some flexibility; for
> +example, documenting that a default of 0 picks an optimal buffer size allows
> +one release to declare the optimal size at 512 while another release declares
> +the optimal size at 4096 - the user-visible behavior is not the bytes used by
> +the buffer, but the fact that the buffer was optimal size.
> +
> +On input structures (only mentioned in the 'data' side of a command), changing
> +from mandatory to optional is safe (older clients will supply the option, and
> +newer clients can benefit from the default); changing from optional to
> +mandatory is backwards incompatible (older clients may be omitting the option,
> +and must continue to work).
> +
> +On output structures (only mentioned in the 'returns' side of a command),
> +changing from mandatory to optional is in general unsafe (older clients may be
> +expecting the field, and could crash if it is missing), although it can be done
> +if the only way that the optional argument will be omitted is when it is
> +triggered by the presence of a new input flag to the command that older clients
> +don't know to send.  Changing from optional to mandatory is safe.
> +
> +A structure that is used in both input and output of various commands
> +must consider the backwards compatibility constraints of both directions
> +of use.
>  
>  A complex type definition can specify another complex type as its base.
>  In this case, the fields of the base type are included as top-level fields


