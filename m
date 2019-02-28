Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzNsa-000150-1o
	for mharc-qemu-trivial@gnu.org; Thu, 28 Feb 2019 10:45:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37090)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mehta.aaru20@gmail.com>) id 1gzNsX-00013O-Gf
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 10:45:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mehta.aaru20@gmail.com>) id 1gzNsW-0002or-2j
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 10:45:45 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:47044)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mehta.aaru20@gmail.com>)
	id 1gzNsT-0002I2-C8; Thu, 28 Feb 2019 10:45:41 -0500
Received: by mail-pl1-x642.google.com with SMTP id c17so6749900plz.13;
	Thu, 28 Feb 2019 07:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SClBCK2yddSgFh8Os61KGmALzi/YIg/hMMyqPv64NPg=;
	b=KDvg8S+NgBBXVPpUUg0MzYQ01LYZRGia7Y+dN7wcWimDazzu+2HqVz+JoSAEk0oeNl
	GDsOtWkbOKXqAvgWiFtjZ+wLeVvSGu22VddUwWj9wrAsBM1+2MmJhVB12VgB3zK9Oa8Z
	InF7Fl0Do2Gpf3t23fs9hJb9uw0zzEmBGsW6x/oMqxp6W5F1ICWh6jjEXWKvaRBwVPwZ
	qtRVop/DQE3yrG/mU6SVRteojzXQVHe1DqQFuvxwbEWZEXCaMKuMWX6rRd8I5F+HDVjo
	4rskFYEBZ6NEjSJbDnz3iEZ/IpIIvURFDa2qpyNe6Q1HDg9aCWe3ge/xMZ6I3yq4buUN
	AsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SClBCK2yddSgFh8Os61KGmALzi/YIg/hMMyqPv64NPg=;
	b=DjTRurwzro8FW0d3FDnGQHEk37SB/HH/RUOk60XROOWMq02aNpZVa9a6K1/uH/NZR6
	mlYD8a6D3pCkB9g+zMZvyzz9MfgJJZBvkt3TqYWr++wOuKNqx3QaIdGehGXHwWFmxsQh
	Ve5Rfa3vzJcYD9BlExAl2K3ee4Qwxhr76TovbxTQh/c4RrXU5hrFD3BV1q6AxXbS3ll4
	RKpIxCbCZg+UcZGIepQ3n4hit6/2A3eW5HjOhpBWP2OzGjqscgqrsDb1CUgC807keJVX
	8XwzeVpB0Cf0nNkaz8zHqrRi+qctl4f9Y6WptqwK8k/ss40sNJEihPw2TOI9pFBZn5Zl
	dtlg==
X-Gm-Message-State: APjAAAXoR63jpvIyC1fNYqYs6XMHpT8nLGb/92fVRyMk3zX5wNV0FDUW
	Z4n8b7990NM/ul7+3944Owc=
X-Google-Smtp-Source: APXvYqzhI1JSuA3ij3FjHgJR9JcV57+Nzhreol798Oa2CJZZ7z3dNb48efJDwtqCGoUrEDxyjL4gfA==
X-Received: by 2002:a17:902:7d89:: with SMTP id a9mr14843plm.33.1551368720500; 
	Thu, 28 Feb 2019 07:45:20 -0800 (PST)
Received: from am-swift ([136.233.9.103]) by smtp.gmail.com with ESMTPSA id
	g188sm14093214pfc.24.2019.02.28.07.45.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 28 Feb 2019 07:45:19 -0800 (PST)
Message-ID: <57c52958d286c103551108b7a9eaab7f8ec34c9b.camel@gmail.com>
From: Aarushi Mehta <mehta.aaru20@gmail.com>
To: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Stefan Hajnoczi
	<stefanha@gmail.com>, Julia Suvorova <jusual@mail.ru>
Date: Thu, 28 Feb 2019 21:15:15 +0530
In-Reply-To: <20190228135054.GE9217@redhat.com>
References: <4817f5c3b20aedba869608c06e76d11a722f4864.camel@gmail.com>
	<20190228135054.GE9217@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] trivial malloc to g_malloc
 in thunk
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
X-List-Received-Date: Thu, 28 Feb 2019 15:45:46 -0000

On Thu, 2019-02-28 at 13:50 +0000, Daniel P. Berrangé wrote:
> On Thu, Feb 28, 2019 at 07:12:45PM +0530, Aarushi Mehta wrote:
> > Hi
> > 
> > This is a trivial contribution part of the BiteSizedTasks on the
> > wiki.
> > I found this discussion 
> > http://git.corpit.ru/?p=qemu.git;a=commit;h=b45c03f585ea9bb1af76c73e82195418c294919d
> > on migrating even g_malloc to g_new, is this not appropriate for
> > the same? 
> > The wiki can presumably use an update regarding this.
> 
> This kind of question should not be in the commit message - it shoudl
> go below the '---'
> 
> > 
> > Signed-off-by: Aarushi <mehta.aaru20@gmail.com>
> > ---
> 
> ....here....
> 
> This lets people answer the question, without the question becoming
> part of the git history.

Eek, apologies. Thank you.
> >  thunk.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/thunk.c b/thunk.c
> > index d5d8645cd4..03fb2abab7 100644
> > --- a/thunk.c
> > +++ b/thunk.c
> > @@ -89,7 +89,7 @@ void thunk_register_struct(int id, const char
> > *name, const argtype *types)
> >      for(i = 0;i < 2; i++) {
> >          offset = 0;
> >          max_align = 1;
> > -        se->field_offsets[i] = malloc(nb_fields * sizeof(int));
> > +        se->field_offsets[i] = g_malloc(nb_fields * sizeof(int));
> 
> Yes, this should use g_new0

Sent a patch in with the same
> >          type_ptr = se->field_types;
> >          for(j = 0;j < nb_fields; j++) {
> >              size = thunk_type_size(type_ptr, i);
> > -- 
> > 2.17.1
> > 
> > 
> > 
> 
> Regards,
> Daniel


