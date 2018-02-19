Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1engeK-00049I-7o
	for mharc-qemu-trivial@gnu.org; Mon, 19 Feb 2018 03:18:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1engeA-00048V-Q6
	for qemu-trivial@nongnu.org; Mon, 19 Feb 2018 03:18:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1enge7-00068M-Eq
	for qemu-trivial@nongnu.org; Mon, 19 Feb 2018 03:18:02 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43470 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>) id 1enge7-00068F-8m
	for qemu-trivial@nongnu.org; Mon, 19 Feb 2018 03:17:59 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E5805EB6F6;
	Mon, 19 Feb 2018 08:17:58 +0000 (UTC)
Received: from [10.36.116.143] (ovpn-116-143.ams2.redhat.com [10.36.116.143])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 232CC2026E04;
	Mon, 19 Feb 2018 08:17:54 +0000 (UTC)
To: Su Hang <suhang16@mails.ucas.ac.cn>, stefanha@redhat.com
Cc: qemu-trivial@nongnu.org
References: <1519025011-26416-1-git-send-email-suhang16@mails.ucas.ac.cn>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <743886eb-26c5-4c1a-6a9f-8c33a75fb355@redhat.com>
Date: Mon, 19 Feb 2018 09:17:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519025011-26416-1-git-send-email-suhang16@mails.ucas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 19 Feb 2018 08:17:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 19 Feb 2018 08:17:58 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH RFC] util: Fix wrong
 indentation TAB with space
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
X-List-Received-Date: Mon, 19 Feb 2018 08:18:10 -0000

On 19.02.2018 08:23, Su Hang wrote:
> BiteSizedTasks: Developer conveniences
>=20
> I use checkpatch.pl to find these files
> (bitops.c envlist.c osdep.c qemu-sockets.c readline.c uri.c)
> use TAB instead of space for indentation.
>=20
> Repalcing all TABs in the beginning of lines with space, and left
> the rest of file untouched.
>=20
> Signed-off-by: Su Hang <suhang16@mails.ucas.ac.cn>
> ---

 Hi,

thanks for tackling this! Some comments below...


> diff --git a/util/envlist.c b/util/envlist.c
> index 1eeb7fca87c1..8c0e32f89c39 100644
> --- a/util/envlist.c
> +++ b/util/envlist.c
> @@ -4,13 +4,13 @@
>  #include "qemu/envlist.h"
> =20
>  struct envlist_entry {
> -	const char *ev_var;			/* actual env value */
> -	QLIST_ENTRY(envlist_entry) ev_link;
> +    const char *ev_var;			/* actual env value */

There are still some TABs here between the code and the comment.

> +    QLIST_ENTRY(envlist_entry) ev_link;
>  };
> =20
>  struct envlist {
> -	QLIST_HEAD(, envlist_entry) el_entries;	/* actual entries */
> -	size_t el_count;			/* number of entries */
> +    QLIST_HEAD(, envlist_entry) el_entries;	/* actual entries */
> +    size_t el_count;			/* number of entries */

dito.

>  };
> =20
>  static int envlist_parse(envlist_t *envlist,
> @@ -22,14 +22,14 @@ static int envlist_parse(envlist_t *envlist,
>  envlist_t *
>  envlist_create(void)
>  {
> -	envlist_t *envlist;
> +    envlist_t *envlist;
> =20
> -	envlist =3D g_malloc(sizeof(*envlist));
> +    envlist =3D g_malloc(sizeof(*envlist));
> =20
> -	QLIST_INIT(&envlist->el_entries);
> -	envlist->el_count =3D 0;
> +    QLIST_INIT(&envlist->el_entries);
> +    envlist->el_count =3D 0;
> =20
> -	return (envlist);
> +    return (envlist);

Not sure whether this should be done in your patch here, or whether we
shoud clean that up later (I'll leave that up to you to decide), but
"return (envlist);" should be replace with "return envlist;" to match
our coding style (and to please our scripts/checkpatch.pl script).

(the same applies for the other "return (...);" statements in your patch)

[...]
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index fbbef69f6275..2e8b26256e64 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -262,8 +262,8 @@ static int inet_listen_saddr(InetSocketAddress *sad=
dr,
>      /* create socket + bind/listen */
>      for (e =3D res; e !=3D NULL; e =3D e->ai_next) {
>          getnameinfo((struct sockaddr*)e->ai_addr,e->ai_addrlen,
> -		        uaddr,INET6_ADDRSTRLEN,uport,32,
> -		        NI_NUMERICHOST | NI_NUMERICSERV);
> +                    uaddr,INET6_ADDRSTRLEN,uport,32,

While you're at it, could you please add a space before
"INET6_ADDRSTRLEN", "uport" and "32" to make checkpatch.pl happy here?

> +                    NI_NUMERICHOST | NI_NUMERICSERV);
> =20
>          port_min =3D inet_getport(e);
>          port_max =3D saddr->has_to ? saddr->to + port_offset : port_mi=
n;
[...]
> diff --git a/util/uri.c b/util/uri.c
> index 21b18281703a..aa1c2da00c17 100644
> --- a/util/uri.c
> +++ b/util/uri.c
> @@ -98,17 +98,17 @@ static void uri_clean(URI *uri);
>   */
> =20
>  #define IS_MARK(x) (((x) =3D=3D '-') || ((x) =3D=3D '_') || ((x) =3D=3D=
 '.') ||     \
> -    ((x) =3D=3D '!') || ((x) =3D=3D '~') || ((x) =3D=3D '*') || ((x) =3D=
=3D '\'') ||    \
> -    ((x) =3D=3D '(') || ((x) =3D=3D ')'))
> +        ((x) =3D=3D '!') || ((x) =3D=3D '~') || ((x) =3D=3D '*') || ((=
x) =3D=3D '\'') ||    \
> +        ((x) =3D=3D '(') || ((x) =3D=3D ')'))
> =20
>  /*
>   * unwise =3D "{" | "}" | "|" | "\" | "^" | "`"
>   */
> =20
>  #define IS_UNWISE(p)                                                  =
  \
> -      (((*(p) =3D=3D '{')) || ((*(p) =3D=3D '}')) || ((*(p) =3D=3D '|'=
)) ||         \
> -       ((*(p) =3D=3D '\\')) || ((*(p) =3D=3D '^')) || ((*(p) =3D=3D '[=
')) ||        \
> -       ((*(p) =3D=3D ']')) || ((*(p) =3D=3D '`')))
> +    (((*(p) =3D=3D '{')) || ((*(p) =3D=3D '}')) || ((*(p) =3D=3D '|'))=
 ||         \
> +     ((*(p) =3D=3D '\\')) || ((*(p) =3D=3D '^')) || ((*(p) =3D=3D '[')=
) ||        \
> +     ((*(p) =3D=3D ']')) || ((*(p) =3D=3D '`')))
>  /*
>   * reserved =3D ";" | "/" | "?" | ":" | "@" | "&" | "=3D" | "+" | "$" =
| "," |
>   *            "[" | "]"
> @@ -150,28 +150,28 @@ static void uri_clean(URI *uri);
> =20
>  #define ISA_DIGIT(p) ((*(p) >=3D '0') && (*(p) <=3D '9'))
>  #define ISA_ALPHA(p) (((*(p) >=3D 'a') && (*(p) <=3D 'z')) ||		\
> -                      ((*(p) >=3D 'A') && (*(p) <=3D 'Z')))
> +        ((*(p) >=3D 'A') && (*(p) <=3D 'Z')))
>  #define ISA_HEXDIG(p)							\

There are still some TABs left in the line above

> -       (ISA_DIGIT(p) || ((*(p) >=3D 'a') && (*(p) <=3D 'f')) ||		\
> -        ((*(p) >=3D 'A') && (*(p) <=3D 'F')))
> +    (ISA_DIGIT(p) || ((*(p) >=3D 'a') && (*(p) <=3D 'f')) ||		\

Here are also some TABs left before the "\"

> +     ((*(p) >=3D 'A') && (*(p) <=3D 'F')))
> =20
>  /*
>   *    sub-delims    =3D "!" / "$" / "&" / "'" / "(" / ")"
>   *                     / "*" / "+" / "," / ";" / "=3D"
>   */
>  #define ISA_SUB_DELIM(p)						\
> -      (((*(p) =3D=3D '!')) || ((*(p) =3D=3D '$')) || ((*(p) =3D=3D '&'=
)) ||		\
> -       ((*(p) =3D=3D '(')) || ((*(p) =3D=3D ')')) || ((*(p) =3D=3D '*'=
)) ||		\
> -       ((*(p) =3D=3D '+')) || ((*(p) =3D=3D ',')) || ((*(p) =3D=3D ';'=
)) ||		\
> -       ((*(p) =3D=3D '=3D')) || ((*(p) =3D=3D '\'')))
> +    (((*(p) =3D=3D '!')) || ((*(p) =3D=3D '$')) || ((*(p) =3D=3D '&'))=
 ||		\
> +     ((*(p) =3D=3D '(')) || ((*(p) =3D=3D ')')) || ((*(p) =3D=3D '*'))=
 ||		\
> +     ((*(p) =3D=3D '+')) || ((*(p) =3D=3D ',')) || ((*(p) =3D=3D ';'))=
 ||		\

dito

> +     ((*(p) =3D=3D '=3D')) || ((*(p) =3D=3D '\'')))
> =20
>  /*
>   *    gen-delims    =3D ":" / "/" / "?" / "#" / "[" / "]" / "@"
>   */
>  #define ISA_GEN_DELIM(p)						\
> -      (((*(p) =3D=3D ':')) || ((*(p) =3D=3D '/')) || ((*(p) =3D=3D '?'=
)) ||         \
> -       ((*(p) =3D=3D '#')) || ((*(p) =3D=3D '[')) || ((*(p) =3D=3D ']'=
)) ||         \
> -       ((*(p) =3D=3D '@')))
> +    (((*(p) =3D=3D ':')) || ((*(p) =3D=3D '/')) || ((*(p) =3D=3D '?'))=
 ||         \
> +     ((*(p) =3D=3D '#')) || ((*(p) =3D=3D '[')) || ((*(p) =3D=3D ']'))=
 ||         \
> +     ((*(p) =3D=3D '@')))
> =20
>  /*
>   *    reserved      =3D gen-delims / sub-delims
> @@ -182,21 +182,21 @@ static void uri_clean(URI *uri);
>   *    unreserved    =3D ALPHA / DIGIT / "-" / "." / "_" / "~"
>   */
>  #define ISA_UNRESERVED(p)						\
> -      ((ISA_ALPHA(p)) || (ISA_DIGIT(p)) || ((*(p) =3D=3D '-')) ||		\
> -       ((*(p) =3D=3D '.')) || ((*(p) =3D=3D '_')) || ((*(p) =3D=3D '~'=
)))
> +    ((ISA_ALPHA(p)) || (ISA_DIGIT(p)) || ((*(p) =3D=3D '-')) ||		\

dito

> +     ((*(p) =3D=3D '.')) || ((*(p) =3D=3D '_')) || ((*(p) =3D=3D '~'))=
)
> =20
>  /*
>   *    pct-encoded   =3D "%" HEXDIG HEXDIG
>   */
>  #define ISA_PCT_ENCODED(p)						\

dito

> -     ((*(p) =3D=3D '%') && (ISA_HEXDIG(p + 1)) && (ISA_HEXDIG(p + 2)))
> +    ((*(p) =3D=3D '%') && (ISA_HEXDIG(p + 1)) && (ISA_HEXDIG(p + 2)))
> =20
>  /*
>   *    pchar         =3D unreserved / pct-encoded / sub-delims / ":" / =
"@"
>   */
>  #define ISA_PCHAR(p)							\
> -     (ISA_UNRESERVED(p) || ISA_PCT_ENCODED(p) || ISA_SUB_DELIM(p) ||	\
> -      ((*(p) =3D=3D ':')) || ((*(p) =3D=3D '@')))
> +    (ISA_UNRESERVED(p) || ISA_PCT_ENCODED(p) || ISA_SUB_DELIM(p) ||	\

dito

> +     ((*(p) =3D=3D ':')) || ((*(p) =3D=3D '@')))
> =20
[...]
> @@ -281,7 +281,7 @@ rfc3986_parse_fragment(URI *uri, const char **str)
>   *
>   * Returns 0 or the error code
>   */
> -static int
> +    static int
>  rfc3986_parse_query(URI *uri, const char **str)
>  {
>      const char *cur;
> @@ -292,11 +292,11 @@ rfc3986_parse_query(URI *uri, const char **str)
>      cur =3D *str;
> =20
>      while ((ISA_PCHAR(cur)) || (*cur =3D=3D '/') || (*cur =3D=3D '?') =
||
> -           ((uri !=3D NULL) && (uri->cleanup & 1) && (IS_UNWISE(cur)))=
)
> +            ((uri !=3D NULL) && (uri->cleanup & 1) && (IS_UNWISE(cur))=
))
>          NEXT(cur);
>      if (uri !=3D NULL) {
>          g_free(uri->query);
> -	uri->query =3D g_strndup (*str, cur - *str);
> +        uri->query =3D g_strndup (*str, cur - *str);

While you're at it, could you please remove the space after "g_strndup"
to make checkpatch.pl happy here?

>      }
>      *str =3D cur;
>      return (0);
> @@ -314,7 +314,7 @@ rfc3986_parse_query(URI *uri, const char **str)
>   *
>   * Returns 0 or the error code
>   */
> -static int
> +    static int
>  rfc3986_parse_port(URI *uri, const char **str)

The change here (and to the other return values in that you've made to
uri.c) looks wrong to me. I think it's more common to keep the return
value starting in column 0, so could you please drop these changes from
your patch?

[...]
> @@ -1047,198 +1047,198 @@ uri_to_string(URI *uri) {
>      len =3D 0;
> =20
>      if (uri->scheme !=3D NULL) {
> -	p =3D uri->scheme;
> -	while (*p !=3D 0) {
> -	    if (len >=3D max) {
> +        p =3D uri->scheme;
> +        while (*p !=3D 0) {
> +            if (len >=3D max) {
>                  temp =3D realloc2n(ret, &max);
> -		ret =3D temp;
> -	    }
> -	    ret[len++] =3D *p++;
> -	}
> -	if (len >=3D max) {
> +                ret =3D temp;
> +            }
> +            ret[len++] =3D *p++;
> +        }
> +        if (len >=3D max) {
>              temp =3D realloc2n(ret, &max);
>              ret =3D temp;
> -	}
> -	ret[len++] =3D ':';
> +        }
> +        ret[len++] =3D ':';
>      }
>      if (uri->opaque !=3D NULL) {
> -	p =3D uri->opaque;
> -	while (*p !=3D 0) {
> -	    if (len + 3 >=3D max) {
> +        p =3D uri->opaque;
> +        while (*p !=3D 0) {
> +            if (len + 3 >=3D max) {
>                  temp =3D realloc2n(ret, &max);
>                  ret =3D temp;
> -	    }
> -	    if (IS_RESERVED(*(p)) || IS_UNRESERVED(*(p)))
> -		ret[len++] =3D *p++;
> -	    else {
> -		int val =3D *(unsigned char *)p++;
> -		int hi =3D val / 0x10, lo =3D val % 0x10;
> -		ret[len++] =3D '%';
> -		ret[len++] =3D hi + (hi > 9? 'A'-10 : '0');
> -		ret[len++] =3D lo + (lo > 9? 'A'-10 : '0');
> -	    }
> -	}
> +            }
> +            if (IS_RESERVED(*(p)) || IS_UNRESERVED(*(p)))
> +                ret[len++] =3D *p++;
> +            else {
> +                int val =3D *(unsigned char *)p++;
> +                int hi =3D val / 0x10, lo =3D val % 0x10;
> +                ret[len++] =3D '%';
> +                ret[len++] =3D hi + (hi > 9? 'A'-10 : '0');
> +                ret[len++] =3D lo + (lo > 9? 'A'-10 : '0');

While you're at it, could you please add a space before the "?" and
around the "-" to make checkpatch.pl happy here?

> +            }
> +        }
>      } else {
> -	if (uri->server !=3D NULL) {
> -	    if (len + 3 >=3D max) {
> +        if (uri->server !=3D NULL) {
> +            if (len + 3 >=3D max) {
>                  temp =3D realloc2n(ret, &max);
>                  ret =3D temp;
> -	    }
> -	    ret[len++] =3D '/';
> -	    ret[len++] =3D '/';
> -	    if (uri->user !=3D NULL) {
> -		p =3D uri->user;
> -		while (*p !=3D 0) {
> -		    if (len + 3 >=3D max) {
> +            }
> +            ret[len++] =3D '/';
> +            ret[len++] =3D '/';
> +            if (uri->user !=3D NULL) {
> +                p =3D uri->user;
> +                while (*p !=3D 0) {
> +                    if (len + 3 >=3D max) {
>                          temp =3D realloc2n(ret, &max);
>                          ret =3D temp;
> -		    }
> -		    if ((IS_UNRESERVED(*(p))) ||
> -			((*(p) =3D=3D ';')) || ((*(p) =3D=3D ':')) ||
> -			((*(p) =3D=3D '&')) || ((*(p) =3D=3D '=3D')) ||
> -			((*(p) =3D=3D '+')) || ((*(p) =3D=3D '$')) ||
> -			((*(p) =3D=3D ',')))
> -			ret[len++] =3D *p++;
> -		    else {
> -			int val =3D *(unsigned char *)p++;
> -			int hi =3D val / 0x10, lo =3D val % 0x10;
> -			ret[len++] =3D '%';
> -			ret[len++] =3D hi + (hi > 9? 'A'-10 : '0');
> -			ret[len++] =3D lo + (lo > 9? 'A'-10 : '0');
> -		    }
> -		}
> -		if (len + 3 >=3D max) {
> +                    }
> +                    if ((IS_UNRESERVED(*(p))) ||
> +                            ((*(p) =3D=3D ';')) || ((*(p) =3D=3D ':'))=
 ||
> +                            ((*(p) =3D=3D '&')) || ((*(p) =3D=3D '=3D'=
)) ||
> +                            ((*(p) =3D=3D '+')) || ((*(p) =3D=3D '$'))=
 ||
> +                            ((*(p) =3D=3D ',')))
> +                        ret[len++] =3D *p++;
> +                    else {
> +                        int val =3D *(unsigned char *)p++;
> +                        int hi =3D val / 0x10, lo =3D val % 0x10;
> +                        ret[len++] =3D '%';
> +                        ret[len++] =3D hi + (hi > 9? 'A'-10 : '0');
> +                        ret[len++] =3D lo + (lo > 9? 'A'-10 : '0');

dito

> +                    }
> +                }
> +                if (len + 3 >=3D max) {
>                      temp =3D realloc2n(ret, &max);
>                      ret =3D temp;
> -		}
> -		ret[len++] =3D '@';
> -	    }
> -	    p =3D uri->server;
> -	    while (*p !=3D 0) {
> -		if (len >=3D max) {
> +                }
> +                ret[len++] =3D '@';
> +            }
> +            p =3D uri->server;
> +            while (*p !=3D 0) {
> +                if (len >=3D max) {
>                      temp =3D realloc2n(ret, &max);
>                      ret =3D temp;
> -		}
> -		ret[len++] =3D *p++;
> -	    }
> -	    if (uri->port > 0) {
> -		if (len + 10 >=3D max) {
> +                }
> +                ret[len++] =3D *p++;
> +            }
> +            if (uri->port > 0) {
> +                if (len + 10 >=3D max) {
>                      temp =3D realloc2n(ret, &max);
>                      ret =3D temp;
> -		}
> -		len +=3D snprintf(&ret[len], max - len, ":%d", uri->port);
> -	    }
> -	} else if (uri->authority !=3D NULL) {
> -	    if (len + 3 >=3D max) {
> +                }
> +                len +=3D snprintf(&ret[len], max - len, ":%d", uri->po=
rt);
> +            }
> +        } else if (uri->authority !=3D NULL) {
> +            if (len + 3 >=3D max) {
>                  temp =3D realloc2n(ret, &max);
>                  ret =3D temp;
> -	    }
> -	    ret[len++] =3D '/';
> -	    ret[len++] =3D '/';
> -	    p =3D uri->authority;
> -	    while (*p !=3D 0) {
> -		if (len + 3 >=3D max) {
> +            }
> +            ret[len++] =3D '/';
> +            ret[len++] =3D '/';
> +            p =3D uri->authority;
> +            while (*p !=3D 0) {
> +                if (len + 3 >=3D max) {
>                      temp =3D realloc2n(ret, &max);
>                      ret =3D temp;
> -		}
> -		if ((IS_UNRESERVED(*(p))) ||
> -                    ((*(p) =3D=3D '$')) || ((*(p) =3D=3D ',')) || ((*(=
p) =3D=3D ';')) ||
> -                    ((*(p) =3D=3D ':')) || ((*(p) =3D=3D '@')) || ((*(=
p) =3D=3D '&')) ||
> -                    ((*(p) =3D=3D '=3D')) || ((*(p) =3D=3D '+')))
> -		    ret[len++] =3D *p++;
> -		else {
> -		    int val =3D *(unsigned char *)p++;
> -		    int hi =3D val / 0x10, lo =3D val % 0x10;
> -		    ret[len++] =3D '%';
> -		    ret[len++] =3D hi + (hi > 9? 'A'-10 : '0');
> -		    ret[len++] =3D lo + (lo > 9? 'A'-10 : '0');
> -		}
> -	    }
> -	} else if (uri->scheme !=3D NULL) {
> -	    if (len + 3 >=3D max) {
> +                }
> +                if ((IS_UNRESERVED(*(p))) ||
> +                        ((*(p) =3D=3D '$')) || ((*(p) =3D=3D ',')) || =
((*(p) =3D=3D ';')) ||
> +                        ((*(p) =3D=3D ':')) || ((*(p) =3D=3D '@')) || =
((*(p) =3D=3D '&')) ||
> +                        ((*(p) =3D=3D '=3D')) || ((*(p) =3D=3D '+')))
> +                    ret[len++] =3D *p++;
> +                else {
> +                    int val =3D *(unsigned char *)p++;
> +                    int hi =3D val / 0x10, lo =3D val % 0x10;
> +                    ret[len++] =3D '%';
> +                    ret[len++] =3D hi + (hi > 9? 'A'-10 : '0');
> +                    ret[len++] =3D lo + (lo > 9? 'A'-10 : '0');

dito

> +                }
> +            }
> +        } else if (uri->scheme !=3D NULL) {
> +            if (len + 3 >=3D max) {
>                  temp =3D realloc2n(ret, &max);
>                  ret =3D temp;
> -	    }
> -	    ret[len++] =3D '/';
> -	    ret[len++] =3D '/';
> -	}
> -	if (uri->path !=3D NULL) {
> -	    p =3D uri->path;
> -	    /*
> -	     * the colon in file:///d: should not be escaped or
> -	     * Windows accesses fail later.
> -	     */
> -	    if ((uri->scheme !=3D NULL) &&
> -		(p[0] =3D=3D '/') &&
> -		(((p[1] >=3D 'a') && (p[1] <=3D 'z')) ||
> -		 ((p[1] >=3D 'A') && (p[1] <=3D 'Z'))) &&
> -		(p[2] =3D=3D ':') &&
> -	        (!strcmp(uri->scheme, "file"))) {
> -		if (len + 3 >=3D max) {
> +            }
> +            ret[len++] =3D '/';
> +            ret[len++] =3D '/';
> +        }
> +        if (uri->path !=3D NULL) {
> +            p =3D uri->path;
> +            /*
> +             * the colon in file:///d: should not be escaped or
> +             * Windows accesses fail later.
> +             */
> +            if ((uri->scheme !=3D NULL) &&
> +                    (p[0] =3D=3D '/') &&
> +                    (((p[1] >=3D 'a') && (p[1] <=3D 'z')) ||
> +                     ((p[1] >=3D 'A') && (p[1] <=3D 'Z'))) &&
> +                    (p[2] =3D=3D ':') &&
> +                    (!strcmp(uri->scheme, "file"))) {
> +                if (len + 3 >=3D max) {
>                      temp =3D realloc2n(ret, &max);
>                      ret =3D temp;
> -		}
> -		ret[len++] =3D *p++;
> -		ret[len++] =3D *p++;
> -		ret[len++] =3D *p++;
> -	    }
> -	    while (*p !=3D 0) {
> -		if (len + 3 >=3D max) {
> +                }
> +                ret[len++] =3D *p++;
> +                ret[len++] =3D *p++;
> +                ret[len++] =3D *p++;
> +            }
> +            while (*p !=3D 0) {
> +                if (len + 3 >=3D max) {
>                      temp =3D realloc2n(ret, &max);
>                      ret =3D temp;
> -		}
> -		if ((IS_UNRESERVED(*(p))) || ((*(p) =3D=3D '/')) ||
> -                    ((*(p) =3D=3D ';')) || ((*(p) =3D=3D '@')) || ((*(=
p) =3D=3D '&')) ||
> -	            ((*(p) =3D=3D '=3D')) || ((*(p) =3D=3D '+')) || ((*(p) =3D=
=3D '$')) ||
> -	            ((*(p) =3D=3D ',')))
> -		    ret[len++] =3D *p++;
> -		else {
> -		    int val =3D *(unsigned char *)p++;
> -		    int hi =3D val / 0x10, lo =3D val % 0x10;
> -		    ret[len++] =3D '%';
> -		    ret[len++] =3D hi + (hi > 9? 'A'-10 : '0');
> -		    ret[len++] =3D lo + (lo > 9? 'A'-10 : '0')> -		}
> -	    }
> -	}
> -	if (uri->query !=3D NULL) {
> -	    if (len + 1 >=3D max) {
> +                }
> +                if ((IS_UNRESERVED(*(p))) || ((*(p) =3D=3D '/')) ||
> +                        ((*(p) =3D=3D ';')) || ((*(p) =3D=3D '@')) || =
((*(p) =3D=3D '&')) ||
> +                        ((*(p) =3D=3D '=3D')) || ((*(p) =3D=3D '+')) |=
| ((*(p) =3D=3D '$')) ||
> +                        ((*(p) =3D=3D ',')))
> +                    ret[len++] =3D *p++;
> +                else {
> +                    int val =3D *(unsigned char *)p++;
> +                    int hi =3D val / 0x10, lo =3D val % 0x10;
> +                    ret[len++] =3D '%';
> +                    ret[len++] =3D hi + (hi > 9? 'A'-10 : '0');
> +                    ret[len++] =3D lo + (lo > 9? 'A'-10 : '0');

dito

[...]
> @@ -1700,23 +1700,23 @@ uri_resolve(const char *uri, const char *base) =
{
>       */
>      res =3D uri_new();
>      if ((ref->scheme =3D=3D NULL) && (ref->path =3D=3D NULL) &&
> -	((ref->authority =3D=3D NULL) && (ref->server =3D=3D NULL))) {
> +            ((ref->authority =3D=3D NULL) && (ref->server =3D=3D NULL)=
)) {
>          res->scheme =3D g_strdup(bas->scheme);
> -	if (bas->authority !=3D NULL)
> -	    res->authority =3D g_strdup(bas->authority);
> -	else if (bas->server !=3D NULL) {
> +        if (bas->authority !=3D NULL)
> +            res->authority =3D g_strdup(bas->authority);
> +        else if (bas->server !=3D NULL) {
>              res->server =3D g_strdup(bas->server);
>              res->user =3D g_strdup(bas->user);
>              res->port =3D bas->port;
> -	}
> +        }
>          res->path =3D g_strdup(bas->path);
>          if (ref->query !=3D NULL) {
> -	    res->query =3D g_strdup (ref->query);
> +            res->query =3D g_strdup (ref->query);

While you're at it, please remove the space after "g_strdup" to make
checkpatch.pl happy.

[...]
> @@ -1958,78 +1958,78 @@ uri_resolve_relative (const char *uri, const ch=
ar * base)
>       * two path components may be missing (bug 316224)
>       */
>      if (bas->path =3D=3D NULL) {
> -	if (ref->path !=3D NULL) {
> -	    uptr =3D ref->path;
> -	    if (*uptr =3D=3D '/')
> -		uptr++;
> -	    /* exception characters from uri_to_string */
> -	    val =3D uri_string_escape(uptr, "/;&=3D+$,");
> -	}
> -	goto done;
> +        if (ref->path !=3D NULL) {
> +            uptr =3D ref->path;
> +            if (*uptr =3D=3D '/')
> +                uptr++;
> +            /* exception characters from uri_to_string */
> +            val =3D uri_string_escape(uptr, "/;&=3D+$,");
> +        }
> +        goto done;
>      }
>      bptr =3D bas->path;
>      if (ref->path =3D=3D NULL) {
> -	for (ix =3D 0; bptr[ix] !=3D 0; ix++) {
> -	    if (bptr[ix] =3D=3D '/')
> -		nbslash++;
> -	}
> -	uptr =3D NULL;
> -	len =3D 1;	/* this is for a string terminator only */
> +        for (ix =3D 0; bptr[ix] !=3D 0; ix++) {
> +            if (bptr[ix] =3D=3D '/')
> +                nbslash++;
> +        }
> +        uptr =3D NULL;
> +        len =3D 1;	/* this is for a string terminator only */

There is still a TAB left here between the code and comment.

>      } else {
> -    /*
> -     * Next we compare the two strings and find where they first diffe=
r
> -     */
> -	if ((ref->path[pos] =3D=3D '.') && (ref->path[pos+1] =3D=3D '/'))
> +        /*
> +         * Next we compare the two strings and find where they first d=
iffer
> +         */
> +        if ((ref->path[pos] =3D=3D '.') && (ref->path[pos+1] =3D=3D '/=
'))
>              pos +=3D 2;
> -	if ((*bptr =3D=3D '.') && (bptr[1] =3D=3D '/'))
> +        if ((*bptr =3D=3D '.') && (bptr[1] =3D=3D '/'))
>              bptr +=3D 2;
> -	else if ((*bptr =3D=3D '/') && (ref->path[pos] !=3D '/'))
> -	    bptr++;
> -	while ((bptr[pos] =3D=3D ref->path[pos]) && (bptr[pos] !=3D 0))
> -	    pos++;
> -
> -	if (bptr[pos] =3D=3D ref->path[pos]) {
> -	    val =3D g_strdup("");
> -	    goto done;		/* (I can't imagine why anyone would do this) */
> -	}
> -
> -	/*
> -	 * In URI, "back up" to the last '/' encountered.  This will be the
> -	 * beginning of the "unique" suffix of URI
> -	 */
> -	ix =3D pos;
> -	if ((ref->path[ix] =3D=3D '/') && (ix > 0))
> -	    ix--;
> -	else if ((ref->path[ix] =3D=3D 0) && (ix > 1) && (ref->path[ix - 1] =3D=
=3D '/'))
> -	    ix -=3D 2;
> -	for (; ix > 0; ix--) {
> -	    if (ref->path[ix] =3D=3D '/')
> -		break;
> -	}
> -	if (ix =3D=3D 0) {
> -	    uptr =3D ref->path;
> -	} else {
> -	    ix++;
> -	    uptr =3D &ref->path[ix];
> -	}
> -
> -	/*
> -	 * In base, count the number of '/' from the differing point
> -	 */
> -	if (bptr[pos] !=3D ref->path[pos]) {/* check for trivial URI =3D=3D b=
ase */
> -	    for (; bptr[ix] !=3D 0; ix++) {
> -		if (bptr[ix] =3D=3D '/')
> -		    nbslash++;
> -	    }
> -	}
> -	len =3D strlen (uptr) + 1;
> +        else if ((*bptr =3D=3D '/') && (ref->path[pos] !=3D '/'))
> +            bptr++;
> +        while ((bptr[pos] =3D=3D ref->path[pos]) && (bptr[pos] !=3D 0)=
)
> +            pos++;
> +
> +        if (bptr[pos] =3D=3D ref->path[pos]) {
> +            val =3D g_strdup("");
> +            goto done;		/* (I can't imagine why anyone would do this) =
*/

There is still a TAB left here between the code and comment.

> @@ -2043,29 +2043,29 @@ uri_resolve_relative (const char *uri, const ch=
ar * base)
>       * Put in as many "../" as needed
>       */
>      for (; nbslash>0; nbslash--) {
> -	*vptr++ =3D '.';
> -	*vptr++ =3D '.';
> -	*vptr++ =3D '/';
> +        *vptr++ =3D '.';
> +        *vptr++ =3D '.';
> +        *vptr++ =3D '/';
>      }
>      /*
>       * Finish up with the end of the URI
>       */
>      if (uptr !=3D NULL) {
>          if ((vptr > val) && (len > 0) &&
> -	    (uptr[0] =3D=3D '/') && (vptr[-1] =3D=3D '/')) {
> -	    memcpy (vptr, uptr + 1, len - 1);
> -	    vptr[len - 2] =3D 0;
> -	} else {
> -	    memcpy (vptr, uptr, len);
> -	    vptr[len - 1] =3D 0;
> -	}
> +                (uptr[0] =3D=3D '/') && (vptr[-1] =3D=3D '/')) {
> +            memcpy (vptr, uptr + 1, len - 1);

While you're at it, please remove the space after "memcpy".

> +            vptr[len - 2] =3D 0;
> +        } else {
> +            memcpy (vptr, uptr, len);

dito

> +            vptr[len - 1] =3D 0;
> +        }
>      } else {
> -	vptr[len - 1] =3D 0;
> +        vptr[len - 1] =3D 0;
>      }
> =20
>      /* escape the freshly-built path */
>      vptr =3D val;
> -	/* exception characters from uri_to_string */
> +    /* exception characters from uri_to_string */
>      val =3D uri_string_escape(vptr, "/;&=3D+$,");
>      g_free(vptr);
> =20
> @@ -2076,9 +2076,9 @@ done:
>      if (remove_path !=3D 0)
>          ref->path =3D NULL;
>      if (ref !=3D NULL)
> -	uri_free (ref);
> +        uri_free (ref);

While you're at it, please remove the space after "uri_free".

>      if (bas !=3D NULL)
> -	uri_free (bas);
> +        uri_free (bas);

dito.

> =20
>      return val;
>  }
> @@ -2087,7 +2087,7 @@ done:
>   * Utility functions to help parse and assemble query strings.
>   */
> =20
> -struct QueryParams *
> +    struct QueryParams *
>  query_params_new (int init_alloc)
>  {
>      struct QueryParams *ps;
> @@ -2105,9 +2105,9 @@ query_params_new (int init_alloc)
>  /* Ensure there is space to store at least one more parameter
>   * at the end of the set.
>   */
> -static int
> +    static int
>  query_params_append (struct QueryParams *ps,
> -               const char *name, const char *value)
> +        const char *name, const char *value)
>  {
>      if (ps->n >=3D ps->alloc) {
>          ps->p =3D g_renew(QueryParam, ps->p, ps->alloc * 2);
> @@ -2122,7 +2122,7 @@ query_params_append (struct QueryParams *ps,
>      return 0;
>  }
> =20
> -void
> +    void
>  query_params_free (struct QueryParams *ps)
>  {
>      int i;
> @@ -2135,7 +2135,7 @@ query_params_free (struct QueryParams *ps)
>      g_free (ps);
>  }
> =20
> -struct QueryParams *
> +    struct QueryParams *
>  query_params_parse (const char *query)
>  {
>      struct QueryParams *ps;
> @@ -2193,7 +2193,7 @@ query_params_parse (const char *query)
>          g_free(name);
>          g_free(value);
> =20
> -    next:
> +next:
>          query =3D end;
>          if (*query) query ++; /* skip '&' separator */
>      }
>=20

 Thanks,
  Thomas

