Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtTK1-0000HW-MS
	for mharc-qemu-trivial@gnu.org; Thu, 09 Jul 2020 05:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jtTK0-0000G7-Mc
 for qemu-trivial@nongnu.org; Thu, 09 Jul 2020 05:58:28 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53022
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jtTJy-0004N7-VP
 for qemu-trivial@nongnu.org; Thu, 09 Jul 2020 05:58:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594288702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TsiVhAjIKg+FB5XMXfehrSKXHq3EBQMHfqa05YX+yN0=;
 b=chZFchR8LajSMf7y7tx4aadd64flsz0zkuU4SDgETvxtUnLDanPCSlHrELJM3KVyIKBtg5
 R9HBpmo7OD1HWDGbJQdliqiilEIAgNRoIJ2eEmilgi47a7oRQT470jqUlDiIPTOkKSF6sG
 0xxZF7SO16azMvoBQced+hvg/y/GRGo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-aq19k5PGPEidtSnTNRvrew-1; Thu, 09 Jul 2020 05:58:19 -0400
X-MC-Unique: aq19k5PGPEidtSnTNRvrew-1
Received: by mail-wm1-f70.google.com with SMTP id z11so1783041wmg.5
 for <qemu-trivial@nongnu.org>; Thu, 09 Jul 2020 02:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TsiVhAjIKg+FB5XMXfehrSKXHq3EBQMHfqa05YX+yN0=;
 b=Hi+HzQYjw96f7m9SuOfLD2U1HHJAUruJq1ymZeNrA3baiwGqO7gxBuu4EDWjvVUVuU
 AN5otcDHOwFvtJ8x7MJSvM2n37gGYDdaWQ7jMFrCypribg7dfj85h4Fsk1/CTTEB0kEm
 rc0E6jAv7mLTwOF+kHdZQ6c0wys40oGKE2r7jgjxiDTI9Qu6bG4U+JYXD9WeaJOsEwhO
 B4IUpRAPapFds5SswkXqUe6JnWLk/jVugyR24gJCXtnEelN451ofuh/DjGpWRi2wzpjf
 SNzLN2NRXA2F+4WWF8kqVevgjipD5yGYQf24HnabOMuK2c+G8peoyYsEs/XPi7/NtKf0
 hn6A==
X-Gm-Message-State: AOAM531y3y7w3UDuIArGFBFe8iVwSlxFhrB2w/CbWc42Wqnq9ozDfK3F
 +BG3GRHyD89gPYdHM7/g3oLzQlFSPqz+i16upXC60FBi+JiIXcFfVTqWuqYILI1+/X44sIioebz
 nIfrFhQs8NipPKX2HoA==
X-Received: by 2002:adf:e40e:: with SMTP id g14mr67805501wrm.271.1594288697658; 
 Thu, 09 Jul 2020 02:58:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOy6v8BQ8JbEsJF5dXlATGTZUDurHSE9tmMnzGFWkzd6nkiVy4AHLvq41egKvGd5AUGDaEPw==
X-Received: by 2002:adf:e40e:: with SMTP id g14mr67805475wrm.271.1594288697336; 
 Thu, 09 Jul 2020 02:58:17 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9541:9439:cb0f:89c?
 ([2001:b07:6468:f312:9541:9439:cb0f:89c])
 by smtp.gmail.com with ESMTPSA id y6sm4212596wmy.0.2020.07.09.02.58.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2020 02:58:16 -0700 (PDT)
Subject: Re: [PATCH] Remove the CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE switch
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20200709053456.4900-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <27814bf4-a370-f8c0-4820-37c027b46b03@redhat.com>
Date: Thu, 9 Jul 2020 11:58:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200709053456.4900-1-thuth@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/09 04:20:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Jul 2020 09:58:28 -0000

On 09/07/20 07:34, Thomas Huth wrote:
> GCC supports "#pragma GCC diagnostic" since version 4.6, and
> Clang seems to support it, too, since its early versions 3.x.
> That means that our minimum required compiler versions all support
> this pragma already and we can remove the test from configure and
> all the related #ifdefs in the code.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure                 | 29 -----------------------------
>  include/ui/gtk.h          |  4 ----
>  include/ui/qemu-pixman.h  |  4 ----
>  scripts/decodetree.py     | 12 ++++--------
>  ui/gtk.c                  |  4 ----
>  util/coroutine-ucontext.c |  4 ----
>  6 files changed, 4 insertions(+), 53 deletions(-)

Cc: qemu-trivial@nongnu.org

Looks good, thanks!

Paolo

> diff --git a/configure b/configure
> index ee6c3c6792..fbf119bbc0 100755
> --- a/configure
> +++ b/configure
> @@ -5703,31 +5703,6 @@ if compile_prog "" "" ; then
>      linux_magic_h=yes
>  fi
>  
> -########################################
> -# check whether we can disable warning option with a pragma (this is needed
> -# to silence warnings in the headers of some versions of external libraries).
> -# This test has to be compiled with -Werror as otherwise an unknown pragma is
> -# only a warning.
> -#
> -# If we can't selectively disable warning in the code, disable -Werror so that
> -# the build doesn't fail anyway.
> -
> -pragma_disable_unused_but_set=no
> -cat > $TMPC << EOF
> -#pragma GCC diagnostic push
> -#pragma GCC diagnostic ignored "-Wstrict-prototypes"
> -#pragma GCC diagnostic pop
> -
> -int main(void) {
> -    return 0;
> -}
> -EOF
> -if compile_prog "-Werror" "" ; then
> -    pragma_diagnostic_available=yes
> -else
> -    werror=no
> -fi
> -
>  ########################################
>  # check if we have valgrind/valgrind.h
>  
> @@ -7661,10 +7636,6 @@ if test "$linux_magic_h" = "yes" ; then
>    echo "CONFIG_LINUX_MAGIC_H=y" >> $config_host_mak
>  fi
>  
> -if test "$pragma_diagnostic_available" = "yes" ; then
> -  echo "CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE=y" >> $config_host_mak
> -fi
> -
>  if test "$valgrind_h" = "yes" ; then
>    echo "CONFIG_VALGRIND_H=y" >> $config_host_mak
>  fi
> diff --git a/include/ui/gtk.h b/include/ui/gtk.h
> index d1b230848a..eaeb450f91 100644
> --- a/include/ui/gtk.h
> +++ b/include/ui/gtk.h
> @@ -1,15 +1,11 @@
>  #ifndef UI_GTK_H
>  #define UI_GTK_H
>  
> -#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
>  /* Work around an -Wstrict-prototypes warning in GTK headers */
>  #pragma GCC diagnostic push
>  #pragma GCC diagnostic ignored "-Wstrict-prototypes"
> -#endif
>  #include <gtk/gtk.h>
> -#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
>  #pragma GCC diagnostic pop
> -#endif
>  
>  #include <gdk/gdkkeysyms.h>
>  
> diff --git a/include/ui/qemu-pixman.h b/include/ui/qemu-pixman.h
> index 3b7cf70157..87737a6f16 100644
> --- a/include/ui/qemu-pixman.h
> +++ b/include/ui/qemu-pixman.h
> @@ -7,14 +7,10 @@
>  #define QEMU_PIXMAN_H
>  
>  /* pixman-0.16.0 headers have a redundant declaration */
> -#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
>  #pragma GCC diagnostic push
>  #pragma GCC diagnostic ignored "-Wredundant-decls"
> -#endif
>  #include <pixman.h>
> -#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
>  #pragma GCC diagnostic pop
> -#endif
>  
>  /*
>   * pixman image formats are defined to be native endian,
> diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> index 530d41ca62..694757b6c2 100755
> --- a/scripts/decodetree.py
> +++ b/scripts/decodetree.py
> @@ -1327,12 +1327,10 @@ def main():
>      # but we can't tell which ones.  Prevent issues from the compiler by
>      # suppressing redundant declaration warnings.
>      if anyextern:
> -        output("#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE\n",
> -               "# pragma GCC diagnostic push\n",
> -               "# pragma GCC diagnostic ignored \"-Wredundant-decls\"\n",
> -               "# ifdef __clang__\n"
> +        output("#pragma GCC diagnostic push\n",
> +               "#pragma GCC diagnostic ignored \"-Wredundant-decls\"\n",
> +               "#ifdef __clang__\n"
>                 "#  pragma GCC diagnostic ignored \"-Wtypedef-redefinition\"\n",
> -               "# endif\n",
>                 "#endif\n\n")
>  
>      out_pats = {}
> @@ -1347,9 +1345,7 @@ def main():
>      output('\n')
>  
>      if anyextern:
> -        output("#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE\n",
> -               "# pragma GCC diagnostic pop\n",
> -               "#endif\n\n")
> +        output("#pragma GCC diagnostic pop\n\n")
>  
>      for n in sorted(formats.keys()):
>          f = formats[n]
> diff --git a/ui/gtk.c b/ui/gtk.c
> index d4b49bd7da..b0cc08ad6d 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -1996,14 +1996,10 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
>               * proper replacement (native opengl support) is only
>               * available in 3.16+.  Silence the warning if possible.
>               */
> -#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
>  #pragma GCC diagnostic push
>  #pragma GCC diagnostic ignored "-Wdeprecated-declarations"
> -#endif
>              gtk_widget_set_double_buffered(vc->gfx.drawing_area, FALSE);
> -#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
>  #pragma GCC diagnostic pop
> -#endif
>              vc->gfx.dcl.ops = &dcl_egl_ops;
>          }
>      } else
> diff --git a/util/coroutine-ucontext.c b/util/coroutine-ucontext.c
> index f0b66320e1..a4e6446ed9 100644
> --- a/util/coroutine-ucontext.c
> +++ b/util/coroutine-ucontext.c
> @@ -237,19 +237,15 @@ Coroutine *qemu_coroutine_new(void)
>  }
>  
>  #ifdef CONFIG_VALGRIND_H
> -#if defined(CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE) && !defined(__clang__)
>  /* Work around an unused variable in the valgrind.h macro... */
>  #pragma GCC diagnostic push
>  #pragma GCC diagnostic ignored "-Wunused-but-set-variable"
> -#endif
>  static inline void valgrind_stack_deregister(CoroutineUContext *co)
>  {
>      VALGRIND_STACK_DEREGISTER(co->valgrind_stack_id);
>  }
> -#if defined(CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE) && !defined(__clang__)
>  #pragma GCC diagnostic pop
>  #endif
> -#endif
>  
>  void qemu_coroutine_delete(Coroutine *co_)
>  {
> 


