Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UL9G2-0005TY-51
	for mharc-qemu-trivial@gnu.org; Thu, 28 Mar 2013 05:36:30 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UL9Fy-0005P0-Et
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 05:36:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UL9Ft-00063o-8H
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 05:36:26 -0400
Received: from mail-wg0-f45.google.com ([74.125.82.45]:47400)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UL9Fl-00061n-3k; Thu, 28 Mar 2013 05:36:21 -0400
Received: by mail-wg0-f45.google.com with SMTP id x12so1297350wgg.0
	for <multiple recipients>; Thu, 28 Mar 2013 02:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=oHlp2PvFTVQvRpXFRCbZB0QxH2GWny8Q3oIiUL4/wzM=;
	b=Ze0cGLk/HrmHHJTMc0LweHvv01t/Cw40QC4Pp52bu5x5PqsOPlHCrGjR/QKekQdeYa
	tcx9Z/LvLvkoJkmCPK05/Suzse4w0ddhpJdP+Uwt8jYKRZA8Te1x8/Rs3DnXyuPfKT2t
	zPoiwbBdIP9/9FEE/VALVECgaZCTlXGd0pvBbtXZ/oDAbfTFJHzU5CCZtRvaO05UWc05
	/9eBbrnDayRfVcwWRmNX5L6+oIjCh1dJC7/RDAeUiRr9vfXxWv4iT8J/yti19pT/tvjD
	KTOLNfvvWs111+AgQFCdUZoc4jCG7L5NrO65e0AuaRumkuupiGyGKOllOTS6NLX0cHQ9
	ma2g==
X-Received: by 10.194.121.6 with SMTP id lg6mr36773788wjb.22.1364463372114;
	Thu, 28 Mar 2013 02:36:12 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:60a5:f151:c14b:54e1])
	by mx.google.com with ESMTPS id gl11sm13099066wic.8.2013.03.28.02.36.10
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 02:36:11 -0700 (PDT)
Date: Thu, 28 Mar 2013 10:36:09 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: mdroth <mdroth@linux.vnet.ibm.com>
Message-ID: <20130328093609.GD24910@stefanha-thinkpad.redhat.com>
References: <5152174F.6080908@linux.vnet.ibm.com>
 <20130327214715.GD8146@vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130327214715.GD8146@vm>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.45
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
X-List-Received-Date: Thu, 28 Mar 2013 09:36:27 -0000

On Wed, Mar 27, 2013 at 04:47:15PM -0500, mdroth wrote:
> On Tue, Mar 26, 2013 at 05:46:55PM -0400, Stefan Berger wrote:
> > This patch fixes some of the memory leaks in
> > test-visitor-serialization but not all of them.
> > 
> > Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
> > 
> > ---
> >  tests/test-visitor-serialization.c |   17 ++++++++++++++---
> >  1 file changed, 14 insertions(+), 3 deletions(-)
> > 
> > Index: qemu-git.pt/tests/test-visitor-serialization.c
> > ===================================================================
> > --- qemu-git.pt.orig/tests/test-visitor-serialization.c
> > +++ qemu-git.pt/tests/test-visitor-serialization.c
> > @@ -258,6 +258,7 @@ static void test_primitives(gconstpointe
> >      g_assert(pt_copy != NULL);
> >      if (pt->type == PTYPE_STRING) {
> >          g_assert_cmpstr(pt->value.string, ==, pt_copy->value.string);
> > +        g_free((char *)pt_copy->value.string);
> >      } else if (pt->type == PTYPE_NUMBER) {
> >          /* we serialize with %f for our reference visitors, so
> > rather than fuzzy
> >           * floating math to test "equality", just compare the
> > formatted values
> > @@ -275,6 +276,7 @@ static void test_primitives(gconstpointe
> > 
> >      ops->cleanup(serialize_data);
> >      g_free(args);
> > +    g_free(pt_copy);
> >  }
> > 
> >  static void test_struct(gconstpointer opaque)
> > @@ -637,6 +639,7 @@ PrimitiveType pt_values[] = {
> >  /* visitor-specific op implementations */
> > 
> >  typedef struct QmpSerializeData {
> > +    QObject *obj;
> >      QmpOutputVisitor *qov;
> >      QmpInputVisitor *qiv;
> >  } QmpSerializeData;
> > @@ -656,10 +659,10 @@ static void qmp_deserialize(void **nativ
> >  {
> >      QmpSerializeData *d = datap;
> >      QString *output_json =
> > qobject_to_json(qmp_output_get_qobject(d->qov));
> > -    QObject *obj = qobject_from_json(qstring_get_str(output_json));
> > 
> > +    d->obj = qobject_from_json(qstring_get_str(output_json));
> >      QDECREF(output_json);
> > -    d->qiv = qmp_input_visitor_new(obj);
> > +    d->qiv = qmp_input_visitor_new(d->obj);
> >      visit(qmp_input_get_visitor(d->qiv), native_out, errp);
> >  }
> > 
> > @@ -668,9 +671,13 @@ static void qmp_cleanup(void *datap)
> >      QmpSerializeData *d = datap;
> >      qmp_output_visitor_cleanup(d->qov);
> >      qmp_input_visitor_cleanup(d->qiv);
> > +    qobject_decref(d->obj);
> 
> We can actually call this just after passing the qobject to
> qmp_input_visitor_new(), which will lead to it getting cleaned up
> in qmp_input_visitor_cleanup(). That way we wouldn't need to hold
> on to the reference in d->obj.
> 
> But this works too, and looks like string visitor still requires
> we hang on to the reference to free it, so either way:
> 
> Reviewed-by: Michael Roth <mdroth@linux.vnet.ibm.com>

Please decref right away like mdroth suggests so the obj field doesn't
need to be introduced.

Stefan

