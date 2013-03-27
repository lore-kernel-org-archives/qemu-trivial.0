Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UKyEc-0001xy-QI
	for mharc-qemu-trivial@gnu.org; Wed, 27 Mar 2013 17:50:18 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1UKyEZ-0001wt-Ok
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2013 17:50:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1UKyEY-0005nm-K6
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2013 17:50:15 -0400
Received: from mail-qa0-f41.google.com ([209.85.216.41]:63362)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>)
	id 1UKyEY-0005ng-F3; Wed, 27 Mar 2013 17:50:14 -0400
Received: by mail-qa0-f41.google.com with SMTP id bs12so1177321qab.7
	for <multiple recipients>; Wed, 27 Mar 2013 14:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=5aHACEZD1RBf9OtRPnDmzuzznFXBNCX2abpQhCmOamg=;
	b=G34uja7LRpcStA9AgcIwcuwTHtuB2N4MoSzak2u+SiVQxR/hQqVE2sPoF7G6cOolBv
	Hmgav3K8OYnlz1E33w9fnEeE8RQ6REE427iP2s78JyljawxLAKOAWrGI62jE7ni5kzgj
	El8AmrOlUZPlA4eIXQzRsbyA9w3fqUtnrg4IkK79ui13Y/LZDfctT6P0ULbrbzGUrcMH
	7dJf00uKHYvzlimLNAPikxSYxe0bFCzKyUVqYA+LuU0gjgtHhBDD/4FxYs3zHR22wJzp
	IXUMEI0YXU5JsrnX/yoEnqCAaMNZmxMkyr41saz4Am3Y5lvsA3Iu+dmYCLd0d8BVfLZd
	n1OQ==
X-Received: by 10.224.32.137 with SMTP id c9mr6857256qad.66.1364421013734;
	Wed, 27 Mar 2013 14:50:13 -0700 (PDT)
Received: from localhost ([32.97.110.51])
	by mx.google.com with ESMTPS id q6sm18866200qeu.1.2013.03.27.14.50.10
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 27 Mar 2013 14:50:11 -0700 (PDT)
Sender: fluxion <flukshun@gmail.com>
Date: Wed, 27 Mar 2013 16:47:15 -0500
From: mdroth <mdroth@linux.vnet.ibm.com>
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Message-ID: <20130327214715.GD8146@vm>
References: <5152174F.6080908@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5152174F.6080908@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.216.41
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Fix some memory leaks in
	test-visitor-serialization
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
X-List-Received-Date: Wed, 27 Mar 2013 21:50:17 -0000

On Tue, Mar 26, 2013 at 05:46:55PM -0400, Stefan Berger wrote:
> This patch fixes some of the memory leaks in
> test-visitor-serialization but not all of them.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
> 
> ---
>  tests/test-visitor-serialization.c |   17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> Index: qemu-git.pt/tests/test-visitor-serialization.c
> ===================================================================
> --- qemu-git.pt.orig/tests/test-visitor-serialization.c
> +++ qemu-git.pt/tests/test-visitor-serialization.c
> @@ -258,6 +258,7 @@ static void test_primitives(gconstpointe
>      g_assert(pt_copy != NULL);
>      if (pt->type == PTYPE_STRING) {
>          g_assert_cmpstr(pt->value.string, ==, pt_copy->value.string);
> +        g_free((char *)pt_copy->value.string);
>      } else if (pt->type == PTYPE_NUMBER) {
>          /* we serialize with %f for our reference visitors, so
> rather than fuzzy
>           * floating math to test "equality", just compare the
> formatted values
> @@ -275,6 +276,7 @@ static void test_primitives(gconstpointe
> 
>      ops->cleanup(serialize_data);
>      g_free(args);
> +    g_free(pt_copy);
>  }
> 
>  static void test_struct(gconstpointer opaque)
> @@ -637,6 +639,7 @@ PrimitiveType pt_values[] = {
>  /* visitor-specific op implementations */
> 
>  typedef struct QmpSerializeData {
> +    QObject *obj;
>      QmpOutputVisitor *qov;
>      QmpInputVisitor *qiv;
>  } QmpSerializeData;
> @@ -656,10 +659,10 @@ static void qmp_deserialize(void **nativ
>  {
>      QmpSerializeData *d = datap;
>      QString *output_json =
> qobject_to_json(qmp_output_get_qobject(d->qov));
> -    QObject *obj = qobject_from_json(qstring_get_str(output_json));
> 
> +    d->obj = qobject_from_json(qstring_get_str(output_json));
>      QDECREF(output_json);
> -    d->qiv = qmp_input_visitor_new(obj);
> +    d->qiv = qmp_input_visitor_new(d->obj);
>      visit(qmp_input_get_visitor(d->qiv), native_out, errp);
>  }
> 
> @@ -668,9 +671,13 @@ static void qmp_cleanup(void *datap)
>      QmpSerializeData *d = datap;
>      qmp_output_visitor_cleanup(d->qov);
>      qmp_input_visitor_cleanup(d->qiv);
> +    qobject_decref(d->obj);

We can actually call this just after passing the qobject to
qmp_input_visitor_new(), which will lead to it getting cleaned up
in qmp_input_visitor_cleanup(). That way we wouldn't need to hold
on to the reference in d->obj.

But this works too, and looks like string visitor still requires
we hang on to the reference to free it, so either way:

Reviewed-by: Michael Roth <mdroth@linux.vnet.ibm.com>

> +
> +    g_free(d);
>  }
> 
>  typedef struct StringSerializeData {
> +    char *string;
>      StringOutputVisitor *sov;
>      StringInputVisitor *siv;
>  } StringSerializeData;
> @@ -690,15 +697,19 @@ static void string_deserialize(void **na
>  {
>      StringSerializeData *d = datap;
> 
> -    d->siv = string_input_visitor_new(string_output_get_string(d->sov));
> +    d->string = string_output_get_string(d->sov);
> +    d->siv = string_input_visitor_new(d->string);
>      visit(string_input_get_visitor(d->siv), native_out, errp);
>  }
> 
>  static void string_cleanup(void *datap)
>  {
>      StringSerializeData *d = datap;
> +
>      string_output_visitor_cleanup(d->sov);
>      string_input_visitor_cleanup(d->siv);
> +    g_free(d->string);
> +    g_free(d);
>  }
> 
>  /* visitor registration, test harness */
> 

