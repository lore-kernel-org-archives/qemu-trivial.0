Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T8Zhk-000351-HP
	for mharc-qemu-trivial@gnu.org; Mon, 03 Sep 2012 12:40:52 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1T8Zhd-000337-9F
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 12:40:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1T8Zhb-0007Gk-W4
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 12:40:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33020)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1T8Zhb-0007G7-Kn; Mon, 03 Sep 2012 12:40:43 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q83GegJa018082
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 3 Sep 2012 12:40:42 -0400
Received: from doriath.home (ovpn-113-57.phx2.redhat.com [10.3.113.57])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q83GeeHO019046; Mon, 3 Sep 2012 12:40:41 -0400
Date: Mon, 3 Sep 2012 13:41:29 -0300
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120903134129.74b4a264@doriath.home>
In-Reply-To: <1346496778-15014-1-git-send-email-sw@weilnetz.de>
References: <1346496778-15014-1-git-send-email-sw@weilnetz.de>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] json-parser: Fix potential
 NULL pointer segfault
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
X-List-Received-Date: Mon, 03 Sep 2012 16:40:51 -0000

On Sat,  1 Sep 2012 12:52:58 +0200
Stefan Weil <sw@weilnetz.de> wrote:

> Report from smatch:
> json-parser.c:474 parse_object(62) error: potential null derefence 'dict'.
> json-parser.c:553 parse_array(75) error: potential null derefence 'list'.
> 
> Label out can be called with list == NULL.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  json-parser.c |    8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/json-parser.c b/json-parser.c
> index 457291b..c31c759 100644
> --- a/json-parser.c
> +++ b/json-parser.c
> @@ -471,7 +471,9 @@ static QObject *parse_object(JSONParserContext *ctxt, va_list *ap)
>  
>  out:
>      parser_context_restore(ctxt, saved_ctxt);
> -    QDECREF(dict);
> +    if (dict) {
> +        QDECREF(dict);
> +    }

I prefer changing QDECREF() to a nop if obj is NULL.

>      return NULL;
>  }
>  
> @@ -550,7 +552,9 @@ static QObject *parse_array(JSONParserContext *ctxt, va_list *ap)
>  
>  out:
>      parser_context_restore(ctxt, saved_ctxt);
> -    QDECREF(list);
> +    if (list) {
> +        QDECREF(list);
> +    }
>      return NULL;
>  }
>  


