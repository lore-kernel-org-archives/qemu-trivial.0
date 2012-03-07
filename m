Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5KMD-0003XN-0c
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2012 12:08:57 -0500
Received: from eggs.gnu.org ([208.118.235.92]:42379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S5KM5-0003WT-SU
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 12:08:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S5KM1-0008Sr-4m
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 12:08:49 -0500
Received: from mail-yw0-f45.google.com ([209.85.213.45]:54736)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S5KM1-0008Q1-0o
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 12:08:45 -0500
Received: by yhoo21 with SMTP id o21so3585809yho.4
	for <qemu-trivial@nongnu.org>; Wed, 07 Mar 2012 09:08:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.185.228 with SMTP id ff4mr997287igc.17.1331140121799; Wed,
	07 Mar 2012 09:08:41 -0800 (PST)
Received: by 10.50.100.198 with HTTP; Wed, 7 Mar 2012 09:08:41 -0800 (PST)
In-Reply-To: <4F57959C.5090408@redhat.com>
References: <1331122589-15717-1-git-send-email-peter.maydell@linaro.org>
	<CAJSP0QVjZ_YqRNrf5dVPHTQmkLwPJeo_M1G2z7gfVHBY_-Z33w@mail.gmail.com>
	<4F57959C.5090408@redhat.com>
Date: Wed, 7 Mar 2012 17:08:41 +0000
Message-ID: <CAFEAcA8_dGFsB0x9gb97S15Mj=BdxuN=Q8u=vbCCkDEPLxhofA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQmCyT7hHv3rJDlg5SjgNoXP82vZswYq3OaHex0/6HLGxZ45cU1h95ot6/KjW7kMU+0pPFiW
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.213.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Quote the
 configure args printed in config.log
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
X-List-Received-Date: Wed, 07 Mar 2012 17:08:55 -0000

On 7 March 2012 17:06, Eric Blake <eblake@redhat.com> wrote:
>>> =C2=A0# Print a helpful header at the top of config.log
>>> =C2=A0echo "# QEMU configure log $(date)" >> config.log
>>> -echo "# produced by $0 $*" >> config.log
>
> This left a trailing newline,
>
>>> +printf "# Configured with:" >> config.log
>>> +printf " '%s'" "$0" "$@" >> config.log
>
> but this does not. =C2=A0You probably want to add another echo afterwards=
, so
> that the next line of the log doesn't look like another configure argumen=
t.

If you look at the whole change, rather than just the
fragment Stefan quoted to comment on:

 # Print a helpful header at the top of config.log
 echo "# QEMU configure log $(date)" >> config.log
-echo "# produced by $0 $*" >> config.log
+printf "# Configured with:" >> config.log
+printf " '%s'" "$0" "$@" >> config.log
+echo >> config.log
 echo "#" >> config.log

...you'll see that it does exactly what you suggest.

-- PMM

