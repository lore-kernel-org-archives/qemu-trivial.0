Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YkYsM-0000KU-2F
	for mharc-qemu-trivial@gnu.org; Tue, 21 Apr 2015 10:10:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1YkYsJ-0000FC-6R
	for qemu-trivial@nongnu.org; Tue, 21 Apr 2015 10:10:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1YkYsI-0004VX-7P
	for qemu-trivial@nongnu.org; Tue, 21 Apr 2015 10:10:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45059)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1YkYsB-0004LF-RP; Tue, 21 Apr 2015 10:10:00 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 9111D8E6E4;
	Tue, 21 Apr 2015 14:09:59 +0000 (UTC)
Received: from localhost (ovpn-113-99.phx2.redhat.com [10.3.113.99])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t3LE9wWP004473; Tue, 21 Apr 2015 10:09:58 -0400
Date: Tue, 21 Apr 2015 10:09:02 -0400
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20150421100902.10c5dbd7@redhat.com>
In-Reply-To: <1428700079-19713-1-git-send-email-eblake@redhat.com>
References: <1428700079-19713-1-git-send-email-eblake@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2] qapi: Drop dead genlist parameter
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
X-List-Received-Date: Tue, 21 Apr 2015 14:10:08 -0000

On Fri, 10 Apr 2015 15:07:59 -0600
Eric Blake <eblake@redhat.com> wrote:

> Defaulting a parameter to True, then having all callers omit or
> pass an explicit True for that parameter, is pointless. Looks
> like it has been dead since introduction in commit 06d64c6, more
> than 4 years ago.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

Applied to the qmp branch, thanks.

> ---
> 
> v2: tweak commit message, don't depend on pending series
> 
>  scripts/qapi-visit.py | 38 +++++++++++++++++---------------------
>  1 file changed, 17 insertions(+), 21 deletions(-)
> 
> diff --git a/scripts/qapi-visit.py b/scripts/qapi-visit.py
> index 8f845a2..1be4d67 100644
> --- a/scripts/qapi-visit.py
> +++ b/scripts/qapi-visit.py
> @@ -2,7 +2,7 @@
>  # QAPI visitor generator
>  #
>  # Copyright IBM, Corp. 2011
> -# Copyright (C) 2014 Red Hat, Inc.
> +# Copyright (C) 2014-2015 Red Hat, Inc.
>  #
>  # Authors:
>  #  Anthony Liguori <aliguori@us.ibm.com>
> @@ -401,34 +401,31 @@ out:
> 
>      return ret
> 
> -def generate_declaration(name, members, genlist=True, builtin_type=False):
> +def generate_declaration(name, members, builtin_type=False):
>      ret = ""
>      if not builtin_type:
>          ret += mcgen('''
> 
>  void visit_type_%(name)s(Visitor *m, %(name)s **obj, const char *name, Error **errp);
>  ''',
> -                    name=name)
> -
> -    if genlist:
> -        ret += mcgen('''
> -void visit_type_%(name)sList(Visitor *m, %(name)sList **obj, const char *name, Error **errp);
> -''',
> -                 name=name)
> -
> -    return ret
> -
> -def generate_enum_declaration(name, members, genlist=True):
> -    ret = ""
> -    if genlist:
> -        ret += mcgen('''
> -void visit_type_%(name)sList(Visitor *m, %(name)sList **obj, const char *name, Error **errp);
> -''',
>                       name=name)
> 
> +    ret += mcgen('''
> +void visit_type_%(name)sList(Visitor *m, %(name)sList **obj, const char *name, Error **errp);
> +''',
> +                 name=name)
> +
> +    return ret
> +
> +def generate_enum_declaration(name, members):
> +    ret = mcgen('''
> +void visit_type_%(name)sList(Visitor *m, %(name)sList **obj, const char *name, Error **errp);
> +''',
> +                name=name)
> +
>      return ret
> 
> -def generate_decl_enum(name, members, genlist=True):
> +def generate_decl_enum(name, members):
>      return mcgen('''
> 
>  void visit_type_%(name)s(Visitor *m, %(name)s *obj, const char *name, Error **errp);
> @@ -542,8 +539,7 @@ exprs = parse_schema(input_file)
>  # for built-in types in our header files and simply guard them
>  fdecl.write(guardstart("QAPI_VISIT_BUILTIN_VISITOR_DECL"))
>  for typename in builtin_types:
> -    fdecl.write(generate_declaration(typename, None, genlist=True,
> -                                     builtin_type=True))
> +    fdecl.write(generate_declaration(typename, None, builtin_type=True))
>  fdecl.write(guardend("QAPI_VISIT_BUILTIN_VISITOR_DECL"))
> 
>  # ...this doesn't work for cases where we link in multiple objects that


