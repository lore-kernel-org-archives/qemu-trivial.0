Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S2Tqj-0008Ch-Aj
	for mharc-qemu-trivial@gnu.org; Tue, 28 Feb 2012 15:40:41 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1S2Tqd-0008BA-CU
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2012 15:40:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1S2Tqb-0007DC-5t
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2012 15:40:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:32134)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1S2Tqa-0007D4-Te; Tue, 28 Feb 2012 15:40:33 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1SKeSJ3031938
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 28 Feb 2012 15:40:28 -0500
Received: from doriath.home (ovpn-113-165.phx2.redhat.com [10.3.113.165])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q1SKeOVc032308; Tue, 28 Feb 2012 15:40:27 -0500
Date: Tue, 28 Feb 2012 17:34:55 -0300
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120228173455.46736c6b@doriath.home>
In-Reply-To: <1330174030-21373-2-git-send-email-sw@weilnetz.de>
References: <1330174030-21373-1-git-send-email-sw@weilnetz.de>
	<1330174030-21373-2-git-send-email-sw@weilnetz.de>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qmp: Fix spelling fourty ->
	forty
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
X-List-Received-Date: Tue, 28 Feb 2012 20:40:39 -0000

On Sat, 25 Feb 2012 13:47:10 +0100
Stefan Weil <sw@weilnetz.de> wrote:

> This was found by codespell.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Acked-by: Luiz Capitulino <lcapitulino@redhat.com>

> ---
>  test-qmp-output-visitor.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/test-qmp-output-visitor.c b/test-qmp-output-visitor.c
> index c94c208..5452cd4 100644
> --- a/test-qmp-output-visitor.c
> +++ b/test-qmp-output-visitor.c
> @@ -221,8 +221,8 @@ static void test_visitor_out_struct_nested(TestOutputVisitorData *data,
>      QObject *obj;
>      QDict *qdict, *dict1, *dict2, *dict3, *userdef;
>      const char *string = "user def string";
> -    const char *strings[] = { "fourty two", "fourty three", "fourty four",
> -                              "fourty five" };
> +    const char *strings[] = { "forty two", "forty three", "forty four",
> +                              "forty five" };
>  
>      ud2 = g_malloc0(sizeof(*ud2));
>      ud2->string0 = g_strdup(strings[0]);


