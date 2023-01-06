Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDueh-00010H-M0
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jan 2023 16:53:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pDueg-0000zt-4H
 for qemu-trivial@nongnu.org; Fri, 06 Jan 2023 16:53:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pDuee-0005OY-Je
 for qemu-trivial@nongnu.org; Fri, 06 Jan 2023 16:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673042015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WSZ1vKIzqHWk12uOpvcGAlHxJQrcJ0JSD/fWdpVNtdU=;
 b=ChxrU2dHqLC8fbRHyxVwfPtNdkGx0GMGJgZFBska3M4NY2W1QU2wsk27Of30YF7AbSgYIT
 e4YkiEAIyxW0es0vj9zJb2snvSsf/nkiZj6K2Rr5H/554Y8KhVe0s3j3Wxe1ZpBVdhATXR
 PQ4Rxj8fBYfre/RbztsxkRLHv84Mpaw=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-558-AD9AvNvoPsip6qt2LgJdrg-1; Fri, 06 Jan 2023 16:53:34 -0500
X-MC-Unique: AD9AvNvoPsip6qt2LgJdrg-1
Received: by mail-lf1-f70.google.com with SMTP id
 a24-20020ac25e78000000b004b5b7587537so987549lfr.18
 for <qemu-trivial@nongnu.org>; Fri, 06 Jan 2023 13:53:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WSZ1vKIzqHWk12uOpvcGAlHxJQrcJ0JSD/fWdpVNtdU=;
 b=PbiO/DCkRY4HGHTv0L9S++13iDQOjgdNvBGvBquUI/Wu1/H/yQyYxmMkEvAc80X2a9
 bj0hirc/SOvYFrkjGvtsqPnU6PcR4TBq9t2UmhNU/bh6LnLPf9/qk6JgsilvVTsGRMPe
 5zLqjfeVDRsDhoWesl6TmFsV4EMUvjrKqthgo2Ay/ic8msxrOIEatP9arwn1giIRy3cc
 0jetk7UkWbZyX+DwyhIi4B8HzC3gQTFl3D4El/OpOi5Di2oV6QIphbG+HGpy9iqsoJsc
 b9muV9UdrkLLx0VRfPQu2wg6da9RXpXioIpadqMXMSBzNYoM3YjNhLM+z+4kxtRcDCeI
 IGEw==
X-Gm-Message-State: AFqh2kqD89PSHtSTo/gYS2RhsCMRS6pU9NRWSbZODR1N4aelkWONjbhi
 XFcjpw15fciwdebfk/Jbk8V42N4Grin84BwLYohuvFnKfn2pdNYgwBCvsqhtgDKcge/K+0WImKt
 r9oV6SWbJc/Ai5Niq7ssNrY8fF6Fts1xqhw==
X-Received: by 2002:a2e:a58a:0:b0:27f:d4ca:d927 with SMTP id
 m10-20020a2ea58a000000b0027fd4cad927mr1658969ljp.184.1673042012679; 
 Fri, 06 Jan 2023 13:53:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuo6kU2kefNw7018JBlFbc0adqkuQt3Pk/bXeVbDdSuafZzdzqK5FbVi+RdaSS2Tiovd/x2Ypub1pgc9XAClo0=
X-Received: by 2002:a2e:a58a:0:b0:27f:d4ca:d927 with SMTP id
 m10-20020a2ea58a000000b0027fd4cad927mr1658963ljp.184.1673042012334; Fri, 06
 Jan 2023 13:53:32 -0800 (PST)
MIME-Version: 1.0
References: <20230103221349.74160-1-arthur.sengileyev@gmail.com>
In-Reply-To: <20230103221349.74160-1-arthur.sengileyev@gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 6 Jan 2023 16:53:20 -0500
Message-ID: <CAFn=p-bBtypjDK75sGDyji45rsykvFXbwsQAg1_CWGi9XrGzuQ@mail.gmail.com>
Subject: Re: [PATCH] Windows installer: keep dependency cache
To: Arthur Sengileyev <arthur.sengileyev@gmail.com>
Cc: sw@weilnetz.de, crosa@redhat.com, qemu-devel@nongnu.org, 
 qemu-trivial@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jan 2023 21:53:38 -0000

On Tue, Jan 3, 2023 at 5:13 PM Arthur Sengileyev
<arthur.sengileyev@gmail.com> wrote:
>
> It should be possible to reuse cache built by previous iteration
> processing next executables. Already processed dependencies are
> already skipped later based on dll name.
>
> Signed-off-by: Arthur Sengileyev <arthur.sengileyev@gmail.com>
> ---
>  scripts/nsis.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/nsis.py b/scripts/nsis.py
> index 03ed7608a2..a2e52df556 100644
> --- a/scripts/nsis.py
> +++ b/scripts/nsis.py
> @@ -91,12 +91,13 @@ def main():
>          print("Searching '%s' for the dependent dlls ..." % search_path)
>          dlldir = os.path.join(destdir + prefix, "dll")
>          os.mkdir(dlldir)
> +        depscache = set()
>
>          for exe in glob.glob(os.path.join(destdir + prefix, "*.exe")):
>              signcode(exe)
>
>              # find all dll dependencies
> -            deps = set(find_deps(exe, search_path, set()))
> +            deps = set(find_deps(exe, search_path, depscache))
>              deps.remove(exe)
>
>              # copy all dlls to the DLLDIR
> --
> 2.39.0
>

ACK for python changes, which seem sane. I've not used the NSIS script
before, though, so I won't grant RB/TB here.

--js


