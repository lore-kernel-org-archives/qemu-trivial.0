Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gEtd7-0004lM-1q
	for mharc-qemu-trivial@gnu.org; Tue, 23 Oct 2018 06:09:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gEtd5-0004V2-Jy
	for qemu-trivial@nongnu.org; Tue, 23 Oct 2018 06:09:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gEtYi-000707-DO
	for qemu-trivial@nongnu.org; Tue, 23 Oct 2018 06:05:18 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:40245)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gEtYa-0006pw-Jx; Tue, 23 Oct 2018 06:05:03 -0400
Received: from [172.29.22.129] ([185.30.24.106]) by mrelayeu.kundenserver.de
	(mreue009 [212.227.15.168]) with ESMTPSA (Nemesis) id
	1MfpGL-1fi1mc3S13-00gK2T; Tue, 23 Oct 2018 12:04:51 +0200
Received: from [172.29.22.129] ([185.30.24.106]) by mrelayeu.kundenserver.de
	(mreue009 [212.227.15.168]) with ESMTPSA (Nemesis) id
	1MfpGL-1fi1mc3S13-00gK2T; Tue, 23 Oct 2018 12:04:51 +0200
To: QEMU Trivial <qemu-trivial@nongnu.org>,
	qemu-devel qemu-devel <qemu-devel@nongnu.org>
Cc: Michael Tokarev <mjt@tls.msk.ru>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <38b0df70-338e-c842-95bb-c1a5fbd54b7b@vivier.eu>
Date: Tue, 23 Oct 2018 11:04:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ikuoloG5HN8x83ig0nTyQbTU4zNw6gaqK/FBXA0PFUc8A9SsDfn
	tbKmXJtc4uo9diA1nGTwtAODNm9RuBHICskgojg+I+Cmqe90L+DGU0g/mGGv8sCEhnd4gm3
	nKHxJN1A/Vi6d/GRIUOC/rY8qUKskWz6apBxLhUUk0fT17w7N3K6PZd5TP0LKXXvajlI3yR
	2zoROqFkZKSl0sTZyM/tA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:vaVCuDV9pZo=:EN+L9htmnW7FwiWVIUzcH6
	Iy4vyIFg9vig8hEPJqxL3nh3b2HqiHlaCJihUmzwpl4YT/c5haMZnwA1o/SvOQjHvYp8k3Pmv
	9neM76wWbjkbDRHCY9SbANKKSfiE2DwjqImPIotKCyZRYx/NOGNvMSb+DuzGid2KyUJYyfbAN
	eYGElhVu5keH09I3wFnQAd/j5qbjWGafOhkqkKjmCfXoaKXSnBnZhIpbkV4X8OilKFDJ7idXL
	TxzalyxQjQyF8Xy+y7rBosc4TcXDufkch0ZDMQUhvSWX9notHLqPNkcMILO0vg0sKGevDWGML
	wltaFVIECDtZxcq9uRJFkGQaX6/oXOWRzyjTPZ9ipgXo+kpqBjsdumrmvz/syEJA4o+Lah8JR
	xcwMtK0J3wk8vuljktzBsVcIdQOJzjkEe4oVkes2NTuiNjC3ITN3cDMlvyUtg5wKNn90VxLNV
	gse7a65TY6k4TKGgSHch2VXWWdkdWXShWY52AvYQw4x9A4FvUsdUimUR+h1L8LAy33zBX7Ypq
	nef46/Ia6FsIppj1azDN0mnGQNtXCpR81OTPFiB+7jmHJtvLN18xZs37KMXJaJbutPX9K1MAN
	acx+3QT+8ZT6rCKoroaUr7XGU3QD90iCQF/wsKMVaoMqDiCw1Vt9UYOeisQ49fkmiSVTldnhK
	l1A6ISvD1DmOG/KOZi2OX64+bDZEsmPk2jwTRbNyz2VpJkHPogDJAxI7o2AyTkxTyJWzi/Vj+
	FISjpMbKxRV76Kat
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-trivial] Call for patches for the qemu-trivial pull request
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
X-List-Received-Date: Tue, 23 Oct 2018 10:09:40 -0000

Hi,

I'm going to collect patches for the next pull request for the
qemu-trivial I'd like to do before the softfreeze.

As we didn't have any pull request for more than 3 months and some of
the patches have been pushed through another maintainer branches, it's a
little bit difficult to collect correctly the patches to send.

So, it would be helpful if any of you knowing that some patches have to
be added to the pull request send me their list.

After the next release, I will try to do pull-requests on a weekly basis.

Thanks,
Laurent

